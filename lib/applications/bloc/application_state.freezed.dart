// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ApplicationListStateTearOff {
  const _$ApplicationListStateTearOff();

  ApplicationListInitial initial() {
    return const ApplicationListInitial();
  }

  ApplicationListLoading loading() {
    return const ApplicationListLoading();
  }

  ApplicationListSuccess success(List<Application>? applications) {
    return ApplicationListSuccess(
      applications,
    );
  }
}

/// @nodoc
const $ApplicationListState = _$ApplicationListStateTearOff();

/// @nodoc
mixin _$ApplicationListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Application>? applications) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Application>? applications)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplicationListInitial value) initial,
    required TResult Function(ApplicationListLoading value) loading,
    required TResult Function(ApplicationListSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationListInitial value)? initial,
    TResult Function(ApplicationListLoading value)? loading,
    TResult Function(ApplicationListSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationListStateCopyWith<$Res> {
  factory $ApplicationListStateCopyWith(ApplicationListState value,
          $Res Function(ApplicationListState) then) =
      _$ApplicationListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApplicationListStateCopyWithImpl<$Res>
    implements $ApplicationListStateCopyWith<$Res> {
  _$ApplicationListStateCopyWithImpl(this._value, this._then);

  final ApplicationListState _value;
  // ignore: unused_field
  final $Res Function(ApplicationListState) _then;
}

/// @nodoc
abstract class $ApplicationListInitialCopyWith<$Res> {
  factory $ApplicationListInitialCopyWith(ApplicationListInitial value,
          $Res Function(ApplicationListInitial) then) =
      _$ApplicationListInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApplicationListInitialCopyWithImpl<$Res>
    extends _$ApplicationListStateCopyWithImpl<$Res>
    implements $ApplicationListInitialCopyWith<$Res> {
  _$ApplicationListInitialCopyWithImpl(ApplicationListInitial _value,
      $Res Function(ApplicationListInitial) _then)
      : super(_value, (v) => _then(v as ApplicationListInitial));

  @override
  ApplicationListInitial get _value => super._value as ApplicationListInitial;
}

/// @nodoc
class _$ApplicationListInitial implements ApplicationListInitial {
  const _$ApplicationListInitial();

  @override
  String toString() {
    return 'ApplicationListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ApplicationListInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Application>? applications) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Application>? applications)? success,
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
    required TResult Function(ApplicationListInitial value) initial,
    required TResult Function(ApplicationListLoading value) loading,
    required TResult Function(ApplicationListSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationListInitial value)? initial,
    TResult Function(ApplicationListLoading value)? loading,
    TResult Function(ApplicationListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ApplicationListInitial implements ApplicationListState {
  const factory ApplicationListInitial() = _$ApplicationListInitial;
}

/// @nodoc
abstract class $ApplicationListLoadingCopyWith<$Res> {
  factory $ApplicationListLoadingCopyWith(ApplicationListLoading value,
          $Res Function(ApplicationListLoading) then) =
      _$ApplicationListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ApplicationListLoadingCopyWithImpl<$Res>
    extends _$ApplicationListStateCopyWithImpl<$Res>
    implements $ApplicationListLoadingCopyWith<$Res> {
  _$ApplicationListLoadingCopyWithImpl(ApplicationListLoading _value,
      $Res Function(ApplicationListLoading) _then)
      : super(_value, (v) => _then(v as ApplicationListLoading));

  @override
  ApplicationListLoading get _value => super._value as ApplicationListLoading;
}

/// @nodoc
class _$ApplicationListLoading implements ApplicationListLoading {
  const _$ApplicationListLoading();

  @override
  String toString() {
    return 'ApplicationListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ApplicationListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Application>? applications) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Application>? applications)? success,
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
    required TResult Function(ApplicationListInitial value) initial,
    required TResult Function(ApplicationListLoading value) loading,
    required TResult Function(ApplicationListSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationListInitial value)? initial,
    TResult Function(ApplicationListLoading value)? loading,
    TResult Function(ApplicationListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ApplicationListLoading implements ApplicationListState {
  const factory ApplicationListLoading() = _$ApplicationListLoading;
}

/// @nodoc
abstract class $ApplicationListSuccessCopyWith<$Res> {
  factory $ApplicationListSuccessCopyWith(ApplicationListSuccess value,
          $Res Function(ApplicationListSuccess) then) =
      _$ApplicationListSuccessCopyWithImpl<$Res>;
  $Res call({List<Application>? applications});
}

/// @nodoc
class _$ApplicationListSuccessCopyWithImpl<$Res>
    extends _$ApplicationListStateCopyWithImpl<$Res>
    implements $ApplicationListSuccessCopyWith<$Res> {
  _$ApplicationListSuccessCopyWithImpl(ApplicationListSuccess _value,
      $Res Function(ApplicationListSuccess) _then)
      : super(_value, (v) => _then(v as ApplicationListSuccess));

  @override
  ApplicationListSuccess get _value => super._value as ApplicationListSuccess;

  @override
  $Res call({
    Object? applications = freezed,
  }) {
    return _then(ApplicationListSuccess(
      applications == freezed
          ? _value.applications
          : applications // ignore: cast_nullable_to_non_nullable
              as List<Application>?,
    ));
  }
}

/// @nodoc
class _$ApplicationListSuccess implements ApplicationListSuccess {
  const _$ApplicationListSuccess(this.applications);

  @override
  final List<Application>? applications;

  @override
  String toString() {
    return 'ApplicationListState.success(applications: $applications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ApplicationListSuccess &&
            (identical(other.applications, applications) ||
                const DeepCollectionEquality()
                    .equals(other.applications, applications)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(applications);

  @JsonKey(ignore: true)
  @override
  $ApplicationListSuccessCopyWith<ApplicationListSuccess> get copyWith =>
      _$ApplicationListSuccessCopyWithImpl<ApplicationListSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Application>? applications) success,
  }) {
    return success(applications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Application>? applications)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(applications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplicationListInitial value) initial,
    required TResult Function(ApplicationListLoading value) loading,
    required TResult Function(ApplicationListSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplicationListInitial value)? initial,
    TResult Function(ApplicationListLoading value)? loading,
    TResult Function(ApplicationListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApplicationListSuccess implements ApplicationListState {
  const factory ApplicationListSuccess(List<Application>? applications) =
      _$ApplicationListSuccess;

  List<Application>? get applications => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationListSuccessCopyWith<ApplicationListSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
