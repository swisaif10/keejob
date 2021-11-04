import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../authentication/authentication.dart';
import '../../exceptions/exceptions.dart';
import '../../services/services.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  LoginBloc(AuthenticationBloc authenticationBloc,
      AuthenticationService authenticationService)
      : _authenticationBloc = authenticationBloc,
        _authenticationService = authenticationService,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    } else if (event is LoginInWithSocial) {
      yield* _mapLoginWithSocialToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user = await _authenticationService.signInWithEmailAndPassword(
          event.email, event.password);
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
    } on AuthenticationException catch (e) {
      yield LoginFailure(error: e.message);
    } catch (err, traceback) {
      print(err);
      print(traceback);
      yield LoginFailure(error: 'An unknown error occured');
    }
  }

  Stream<LoginState> _mapLoginWithSocialToState(
      LoginInWithSocial event) async* {
    yield LoginLoading();
    try {
      final user = await _authenticationService.signInWithSocial(
          event.socialBackend, event.accessToken);

      if (user.toString().isNotEmpty) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: 'Something went wrong!');
      }

    } on AuthenticationException catch (e) {
      yield LoginFailure(error: e.message);
    } catch (err, traceback) {
      print(err);
      print(traceback);
      yield LoginFailure(error: 'Une erreur inconnue est survenue');
    }
  }
}
