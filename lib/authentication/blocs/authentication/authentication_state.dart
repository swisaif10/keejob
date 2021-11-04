import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';

part 'authentication_state.freezed.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = AuthenticationInitial;
  const factory AuthenticationState.loading() = AuthenticationLoading;
  const factory AuthenticationState.notAuthenticated() =
      AuthenticationNotAuthenticated;
  const factory AuthenticationState.authenticated(User user) =
      AuthenticationAuthenticated;
  const factory AuthenticationState.failure(String message) =
      AuthenticationFailure;
}
