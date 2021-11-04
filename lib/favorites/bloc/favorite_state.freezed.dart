// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavoriteListStateTearOff {
  const _$FavoriteListStateTearOff();

  FavoriteListInitial initial() {
    return const FavoriteListInitial();
  }

  FavoriteListLoading loading() {
    return const FavoriteListLoading();
  }

  FavoriteListSuccess success(List<FavoriteJob>? favoriteJobs) {
    return FavoriteListSuccess(
      favoriteJobs,
    );
  }
}

/// @nodoc
const $FavoriteListState = _$FavoriteListStateTearOff();

/// @nodoc
mixin _$FavoriteListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FavoriteJob>? favoriteJobs) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FavoriteJob>? favoriteJobs)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteListInitial value) initial,
    required TResult Function(FavoriteListLoading value) loading,
    required TResult Function(FavoriteListSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteListInitial value)? initial,
    TResult Function(FavoriteListLoading value)? loading,
    TResult Function(FavoriteListSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteListStateCopyWith<$Res> {
  factory $FavoriteListStateCopyWith(
          FavoriteListState value, $Res Function(FavoriteListState) then) =
      _$FavoriteListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteListStateCopyWithImpl<$Res>
    implements $FavoriteListStateCopyWith<$Res> {
  _$FavoriteListStateCopyWithImpl(this._value, this._then);

  final FavoriteListState _value;
  // ignore: unused_field
  final $Res Function(FavoriteListState) _then;
}

/// @nodoc
abstract class $FavoriteListInitialCopyWith<$Res> {
  factory $FavoriteListInitialCopyWith(
          FavoriteListInitial value, $Res Function(FavoriteListInitial) then) =
      _$FavoriteListInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteListInitialCopyWithImpl<$Res>
    extends _$FavoriteListStateCopyWithImpl<$Res>
    implements $FavoriteListInitialCopyWith<$Res> {
  _$FavoriteListInitialCopyWithImpl(
      FavoriteListInitial _value, $Res Function(FavoriteListInitial) _then)
      : super(_value, (v) => _then(v as FavoriteListInitial));

  @override
  FavoriteListInitial get _value => super._value as FavoriteListInitial;
}

/// @nodoc
class _$FavoriteListInitial implements FavoriteListInitial {
  const _$FavoriteListInitial();

  @override
  String toString() {
    return 'FavoriteListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoriteListInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FavoriteJob>? favoriteJobs) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FavoriteJob>? favoriteJobs)? success,
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
    required TResult Function(FavoriteListInitial value) initial,
    required TResult Function(FavoriteListLoading value) loading,
    required TResult Function(FavoriteListSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteListInitial value)? initial,
    TResult Function(FavoriteListLoading value)? loading,
    TResult Function(FavoriteListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FavoriteListInitial implements FavoriteListState {
  const factory FavoriteListInitial() = _$FavoriteListInitial;
}

/// @nodoc
abstract class $FavoriteListLoadingCopyWith<$Res> {
  factory $FavoriteListLoadingCopyWith(
          FavoriteListLoading value, $Res Function(FavoriteListLoading) then) =
      _$FavoriteListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteListLoadingCopyWithImpl<$Res>
    extends _$FavoriteListStateCopyWithImpl<$Res>
    implements $FavoriteListLoadingCopyWith<$Res> {
  _$FavoriteListLoadingCopyWithImpl(
      FavoriteListLoading _value, $Res Function(FavoriteListLoading) _then)
      : super(_value, (v) => _then(v as FavoriteListLoading));

  @override
  FavoriteListLoading get _value => super._value as FavoriteListLoading;
}

/// @nodoc
class _$FavoriteListLoading implements FavoriteListLoading {
  const _$FavoriteListLoading();

  @override
  String toString() {
    return 'FavoriteListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoriteListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FavoriteJob>? favoriteJobs) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FavoriteJob>? favoriteJobs)? success,
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
    required TResult Function(FavoriteListInitial value) initial,
    required TResult Function(FavoriteListLoading value) loading,
    required TResult Function(FavoriteListSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteListInitial value)? initial,
    TResult Function(FavoriteListLoading value)? loading,
    TResult Function(FavoriteListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoriteListLoading implements FavoriteListState {
  const factory FavoriteListLoading() = _$FavoriteListLoading;
}

/// @nodoc
abstract class $FavoriteListSuccessCopyWith<$Res> {
  factory $FavoriteListSuccessCopyWith(
          FavoriteListSuccess value, $Res Function(FavoriteListSuccess) then) =
      _$FavoriteListSuccessCopyWithImpl<$Res>;
  $Res call({List<FavoriteJob>? favoriteJobs});
}

/// @nodoc
class _$FavoriteListSuccessCopyWithImpl<$Res>
    extends _$FavoriteListStateCopyWithImpl<$Res>
    implements $FavoriteListSuccessCopyWith<$Res> {
  _$FavoriteListSuccessCopyWithImpl(
      FavoriteListSuccess _value, $Res Function(FavoriteListSuccess) _then)
      : super(_value, (v) => _then(v as FavoriteListSuccess));

  @override
  FavoriteListSuccess get _value => super._value as FavoriteListSuccess;

  @override
  $Res call({
    Object? favoriteJobs = freezed,
  }) {
    return _then(FavoriteListSuccess(
      favoriteJobs == freezed
          ? _value.favoriteJobs
          : favoriteJobs // ignore: cast_nullable_to_non_nullable
              as List<FavoriteJob>?,
    ));
  }
}

/// @nodoc
class _$FavoriteListSuccess implements FavoriteListSuccess {
  const _$FavoriteListSuccess(this.favoriteJobs);

  @override
  final List<FavoriteJob>? favoriteJobs;

  @override
  String toString() {
    return 'FavoriteListState.success(favoriteJobs: $favoriteJobs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoriteListSuccess &&
            (identical(other.favoriteJobs, favoriteJobs) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteJobs, favoriteJobs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(favoriteJobs);

  @JsonKey(ignore: true)
  @override
  $FavoriteListSuccessCopyWith<FavoriteListSuccess> get copyWith =>
      _$FavoriteListSuccessCopyWithImpl<FavoriteListSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FavoriteJob>? favoriteJobs) success,
  }) {
    return success(favoriteJobs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FavoriteJob>? favoriteJobs)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(favoriteJobs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteListInitial value) initial,
    required TResult Function(FavoriteListLoading value) loading,
    required TResult Function(FavoriteListSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteListInitial value)? initial,
    TResult Function(FavoriteListLoading value)? loading,
    TResult Function(FavoriteListSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FavoriteListSuccess implements FavoriteListState {
  const factory FavoriteListSuccess(List<FavoriteJob>? favoriteJobs) =
      _$FavoriteListSuccess;

  List<FavoriteJob>? get favoriteJobs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteListSuccessCopyWith<FavoriteListSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
