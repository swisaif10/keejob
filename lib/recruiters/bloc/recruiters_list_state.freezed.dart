// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recruiters_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecruitersListStateTearOff {
  const _$RecruitersListStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Success success(List<Recruiter> recruiters, String nextUrl) {
    return Success(
      recruiters,
      nextUrl,
    );
  }
}

/// @nodoc
const $RecruitersListState = _$RecruitersListStateTearOff();

/// @nodoc
mixin _$RecruitersListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Recruiter> recruiters, String nextUrl)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Recruiter> recruiters, String nextUrl)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecruitersListStateCopyWith<$Res> {
  factory $RecruitersListStateCopyWith(
          RecruitersListState value, $Res Function(RecruitersListState) then) =
      _$RecruitersListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecruitersListStateCopyWithImpl<$Res>
    implements $RecruitersListStateCopyWith<$Res> {
  _$RecruitersListStateCopyWithImpl(this._value, this._then);

  final RecruitersListState _value;
  // ignore: unused_field
  final $Res Function(RecruitersListState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$RecruitersListStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'RecruitersListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Recruiter> recruiters, String nextUrl)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Recruiter> recruiters, String nextUrl)? success,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements RecruitersListState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<Recruiter> recruiters, String nextUrl});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    extends _$RecruitersListStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? recruiters = freezed,
    Object? nextUrl = freezed,
  }) {
    return _then(Success(
      recruiters == freezed
          ? _value.recruiters
          : recruiters // ignore: cast_nullable_to_non_nullable
              as List<Recruiter>,
      nextUrl == freezed
          ? _value.nextUrl
          : nextUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$Success implements Success {
  const _$Success(this.recruiters, this.nextUrl);

  @override
  final List<Recruiter> recruiters;
  @override
  final String nextUrl;

  @override
  String toString() {
    return 'RecruitersListState.success(recruiters: $recruiters, nextUrl: $nextUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.recruiters, recruiters) ||
                const DeepCollectionEquality()
                    .equals(other.recruiters, recruiters)) &&
            (identical(other.nextUrl, nextUrl) ||
                const DeepCollectionEquality().equals(other.nextUrl, nextUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recruiters) ^
      const DeepCollectionEquality().hash(nextUrl);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Recruiter> recruiters, String nextUrl)
        success,
  }) {
    return success(recruiters, nextUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Recruiter> recruiters, String nextUrl)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(recruiters, nextUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements RecruitersListState {
  const factory Success(List<Recruiter> recruiters, String nextUrl) = _$Success;

  List<Recruiter> get recruiters => throw _privateConstructorUsedError;
  String get nextUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}
