import 'package:bloc/bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';
import '../../services/services.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authenticationService;

  AuthenticationBloc(AuthenticationService authenticationService)
      : _authenticationService = authenticationService,
        super(AuthenticationState.initial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppLoaded) {
      yield* _mapAppLoadedToState(event);
    }

    if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState(event);
    }

    if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppLoadedToState(AppLoaded event) async* {
    yield AuthenticationLoading();
    try {
      final currentUser = await _authenticationService.getCurrentUser();

      if (currentUser != null) {
        yield AuthenticationState.authenticated(currentUser);
      } else {
        yield AuthenticationNotAuthenticated();
      }
    } catch (error, stracktrace) {
      print('$error $stracktrace');
      yield AuthenticationState.failure('An unknown error occurred');
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState(
      UserLoggedIn event) async* {
    yield AuthenticationState.authenticated(event.user);
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState(
      UserLoggedOut event) async* {
    await _authenticationService.signOut();
    yield AuthenticationState.notAuthenticated();
  }
}
