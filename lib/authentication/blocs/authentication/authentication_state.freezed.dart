// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  AuthenticationInitial initial() {
    return const AuthenticationInitial();
  }

  AuthenticationLoading loading() {
    return const AuthenticationLoading();
  }

  AuthenticationNotAuthenticated notAuthenticated() {
    return const AuthenticationNotAuthenticated();
  }

  AuthenticationAuthenticated authenticated(User user) {
    return AuthenticationAuthenticated(
      user,
    );
  }

  AuthenticationFailure failure(String message) {
    return AuthenticationFailure(
      message,
    );
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notAuthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notAuthenticated,
    TResult Function(User user)? authenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) initial,
    required TResult Function(AuthenticationLoading value) loading,
    required TResult Function(AuthenticationNotAuthenticated value)
        notAuthenticated,
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? initial,
    TResult Function(AuthenticationLoading value)? loading,
    TResult Function(AuthenticationNotAuthenticated value)? notAuthenticated,
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class $AuthenticationInitialCopyWith<$Res> {
  factory $AuthenticationInitialCopyWith(AuthenticationInitial value,
          $Res Function(AuthenticationInitial) then) =
      _$AuthenticationInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationInitialCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationInitialCopyWith<$Res> {
  _$AuthenticationInitialCopyWithImpl(
      AuthenticationInitial _value, $Res Function(AuthenticationInitial) _then)
      : super(_value, (v) => _then(v as AuthenticationInitial));

  @override
  AuthenticationInitial get _value => super._value as AuthenticationInitial;
}

/// @nodoc
class _$AuthenticationInitial implements AuthenticationInitial {
  const _$AuthenticationInitial();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthenticationInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notAuthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notAuthenticated,
    TResult Function(User user)? authenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) initial,
    required TResult Function(AuthenticationLoading value) loading,
    required TResult Function(AuthenticationNotAuthenticated value)
        notAuthenticated,
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? initial,
    TResult Function(AuthenticationLoading value)? loading,
    TResult Function(AuthenticationNotAuthenticated value)? notAuthenticated,
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthenticationInitial implements AuthenticationState {
  const factory AuthenticationInitial() = _$AuthenticationInitial;
}

/// @nodoc
abstract class $AuthenticationLoadingCopyWith<$Res> {
  factory $AuthenticationLoadingCopyWith(AuthenticationLoading value,
          $Res Function(AuthenticationLoading) then) =
      _$AuthenticationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationLoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationLoadingCopyWith<$Res> {
  _$AuthenticationLoadingCopyWithImpl(
      AuthenticationLoading _value, $Res Function(AuthenticationLoading) _then)
      : super(_value, (v) => _then(v as AuthenticationLoading));

  @override
  AuthenticationLoading get _value => super._value as AuthenticationLoading;
}

/// @nodoc
class _$AuthenticationLoading implements AuthenticationLoading {
  const _$AuthenticationLoading();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthenticationLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notAuthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notAuthenticated,
    TResult Function(User user)? authenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) initial,
    required TResult Function(AuthenticationLoading value) loading,
    required TResult Function(AuthenticationNotAuthenticated value)
        notAuthenticated,
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? initial,
    TResult Function(AuthenticationLoading value)? loading,
    TResult Function(AuthenticationNotAuthenticated value)? notAuthenticated,
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthenticationLoading implements AuthenticationState {
  const factory AuthenticationLoading() = _$AuthenticationLoading;
}

/// @nodoc
abstract class $AuthenticationNotAuthenticatedCopyWith<$Res> {
  factory $AuthenticationNotAuthenticatedCopyWith(
          AuthenticationNotAuthenticated value,
          $Res Function(AuthenticationNotAuthenticated) then) =
      _$AuthenticationNotAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationNotAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationNotAuthenticatedCopyWith<$Res> {
  _$AuthenticationNotAuthenticatedCopyWithImpl(
      AuthenticationNotAuthenticated _value,
      $Res Function(AuthenticationNotAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationNotAuthenticated));

  @override
  AuthenticationNotAuthenticated get _value =>
      super._value as AuthenticationNotAuthenticated;
}

/// @nodoc
class _$AuthenticationNotAuthenticated
    implements AuthenticationNotAuthenticated {
  const _$AuthenticationNotAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthenticationNotAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notAuthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function(String message) failure,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notAuthenticated,
    TResult Function(User user)? authenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) initial,
    required TResult Function(AuthenticationLoading value) loading,
    required TResult Function(AuthenticationNotAuthenticated value)
        notAuthenticated,
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationFailure value) failure,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? initial,
    TResult Function(AuthenticationLoading value)? loading,
    TResult Function(AuthenticationNotAuthenticated value)? notAuthenticated,
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationNotAuthenticated implements AuthenticationState {
  const factory AuthenticationNotAuthenticated() =
      _$AuthenticationNotAuthenticated;
}

/// @nodoc
abstract class $AuthenticationAuthenticatedCopyWith<$Res> {
  factory $AuthenticationAuthenticatedCopyWith(
          AuthenticationAuthenticated value,
          $Res Function(AuthenticationAuthenticated) then) =
      _$AuthenticationAuthenticatedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$AuthenticationAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationAuthenticatedCopyWith<$Res> {
  _$AuthenticationAuthenticatedCopyWithImpl(AuthenticationAuthenticated _value,
      $Res Function(AuthenticationAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationAuthenticated));

  @override
  AuthenticationAuthenticated get _value =>
      super._value as AuthenticationAuthenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(AuthenticationAuthenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
class _$AuthenticationAuthenticated implements AuthenticationAuthenticated {
  const _$AuthenticationAuthenticated(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationAuthenticated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $AuthenticationAuthenticatedCopyWith<AuthenticationAuthenticated>
      get copyWith => _$AuthenticationAuthenticatedCopyWithImpl<
          AuthenticationAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notAuthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function(String message) failure,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notAuthenticated,
    TResult Function(User user)? authenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) initial,
    required TResult Function(AuthenticationLoading value) loading,
    required TResult Function(AuthenticationNotAuthenticated value)
        notAuthenticated,
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationFailure value) failure,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? initial,
    TResult Function(AuthenticationLoading value)? loading,
    TResult Function(AuthenticationNotAuthenticated value)? notAuthenticated,
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationAuthenticated implements AuthenticationState {
  const factory AuthenticationAuthenticated(User user) =
      _$AuthenticationAuthenticated;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationAuthenticatedCopyWith<AuthenticationAuthenticated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationFailureCopyWith<$Res> {
  factory $AuthenticationFailureCopyWith(AuthenticationFailure value,
          $Res Function(AuthenticationFailure) then) =
      _$AuthenticationFailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$AuthenticationFailureCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  _$AuthenticationFailureCopyWithImpl(
      AuthenticationFailure _value, $Res Function(AuthenticationFailure) _then)
      : super(_value, (v) => _then(v as AuthenticationFailure));

  @override
  AuthenticationFailure get _value => super._value as AuthenticationFailure;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(AuthenticationFailure(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$AuthenticationFailure implements AuthenticationFailure {
  const _$AuthenticationFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthenticationFailure &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $AuthenticationFailureCopyWith<AuthenticationFailure> get copyWith =>
      _$AuthenticationFailureCopyWithImpl<AuthenticationFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() notAuthenticated,
    required TResult Function(User user) authenticated,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? notAuthenticated,
    TResult Function(User user)? authenticated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationInitial value) initial,
    required TResult Function(AuthenticationLoading value) loading,
    required TResult Function(AuthenticationNotAuthenticated value)
        notAuthenticated,
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationInitial value)? initial,
    TResult Function(AuthenticationLoading value)? loading,
    TResult Function(AuthenticationNotAuthenticated value)? notAuthenticated,
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthenticationFailure implements AuthenticationState {
  const factory AuthenticationFailure(String message) = _$AuthenticationFailure;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationFailureCopyWith<AuthenticationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
