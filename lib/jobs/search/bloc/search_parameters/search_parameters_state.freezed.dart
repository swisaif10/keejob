// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_parameters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchParametersStateTearOff {
  const _$SearchParametersStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Saved saved(
      {String? keyword,
      List<int> localities = const [],
      List<int> professions = const [],
      int? education,
      List<int> jobTypes = const [],
      int? experienceLevel}) {
    return Saved(
      keyword: keyword,
      localities: localities,
      professions: professions,
      education: education,
      jobTypes: jobTypes,
      experienceLevel: experienceLevel,
    );
  }
}

/// @nodoc
const $SearchParametersState = _$SearchParametersStateTearOff();

/// @nodoc
mixin _$SearchParametersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String? keyword,
            List<int> localities,
            List<int> professions,
            int? education,
            List<int> jobTypes,
            int? experienceLevel)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String? keyword,
            List<int> localities,
            List<int> professions,
            int? education,
            List<int> jobTypes,
            int? experienceLevel)?
        saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchParametersStateCopyWith<$Res> {
  factory $SearchParametersStateCopyWith(SearchParametersState value,
          $Res Function(SearchParametersState) then) =
      _$SearchParametersStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchParametersStateCopyWithImpl<$Res>
    implements $SearchParametersStateCopyWith<$Res> {
  _$SearchParametersStateCopyWithImpl(this._value, this._then);

  final SearchParametersState _value;
  // ignore: unused_field
  final $Res Function(SearchParametersState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$SearchParametersStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchParametersState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchParametersState.initial'));
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
    required TResult Function(
            String? keyword,
            List<int> localities,
            List<int> professions,
            int? education,
            List<int> jobTypes,
            int? experienceLevel)
        saved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String? keyword,
            List<int> localities,
            List<int> professions,
            int? education,
            List<int> jobTypes,
            int? experienceLevel)?
        saved,
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
    required TResult Function(Saved value) saved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SearchParametersState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $SavedCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
  $Res call(
      {String? keyword,
      List<int> localities,
      List<int> professions,
      int? education,
      List<int> jobTypes,
      int? experienceLevel});
}

/// @nodoc
class _$SavedCopyWithImpl<$Res>
    extends _$SearchParametersStateCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? localities = freezed,
    Object? professions = freezed,
    Object? education = freezed,
    Object? jobTypes = freezed,
    Object? experienceLevel = freezed,
  }) {
    return _then(Saved(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      localities: localities == freezed
          ? _value.localities
          : localities // ignore: cast_nullable_to_non_nullable
              as List<int>,
      professions: professions == freezed
          ? _value.professions
          : professions // ignore: cast_nullable_to_non_nullable
              as List<int>,
      education: education == freezed
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as int?,
      jobTypes: jobTypes == freezed
          ? _value.jobTypes
          : jobTypes // ignore: cast_nullable_to_non_nullable
              as List<int>,
      experienceLevel: experienceLevel == freezed
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
class _$Saved with DiagnosticableTreeMixin implements Saved {
  const _$Saved(
      {this.keyword,
      this.localities = const [],
      this.professions = const [],
      this.education,
      this.jobTypes = const [],
      this.experienceLevel});

  @override
  final String? keyword;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> localities;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> professions;
  @override
  final int? education;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> jobTypes;
  @override
  final int? experienceLevel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchParametersState.saved(keyword: $keyword, localities: $localities, professions: $professions, education: $education, jobTypes: $jobTypes, experienceLevel: $experienceLevel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchParametersState.saved'))
      ..add(DiagnosticsProperty('keyword', keyword))
      ..add(DiagnosticsProperty('localities', localities))
      ..add(DiagnosticsProperty('professions', professions))
      ..add(DiagnosticsProperty('education', education))
      ..add(DiagnosticsProperty('jobTypes', jobTypes))
      ..add(DiagnosticsProperty('experienceLevel', experienceLevel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Saved &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality()
                    .equals(other.keyword, keyword)) &&
            (identical(other.localities, localities) ||
                const DeepCollectionEquality()
                    .equals(other.localities, localities)) &&
            (identical(other.professions, professions) ||
                const DeepCollectionEquality()
                    .equals(other.professions, professions)) &&
            (identical(other.education, education) ||
                const DeepCollectionEquality()
                    .equals(other.education, education)) &&
            (identical(other.jobTypes, jobTypes) ||
                const DeepCollectionEquality()
                    .equals(other.jobTypes, jobTypes)) &&
            (identical(other.experienceLevel, experienceLevel) ||
                const DeepCollectionEquality()
                    .equals(other.experienceLevel, experienceLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(keyword) ^
      const DeepCollectionEquality().hash(localities) ^
      const DeepCollectionEquality().hash(professions) ^
      const DeepCollectionEquality().hash(education) ^
      const DeepCollectionEquality().hash(jobTypes) ^
      const DeepCollectionEquality().hash(experienceLevel);

  @JsonKey(ignore: true)
  @override
  $SavedCopyWith<Saved> get copyWith =>
      _$SavedCopyWithImpl<Saved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String? keyword,
            List<int> localities,
            List<int> professions,
            int? education,
            List<int> jobTypes,
            int? experienceLevel)
        saved,
  }) {
    return saved(
        keyword, localities, professions, education, jobTypes, experienceLevel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            String? keyword,
            List<int> localities,
            List<int> professions,
            int? education,
            List<int> jobTypes,
            int? experienceLevel)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(keyword, localities, professions, education, jobTypes,
          experienceLevel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved implements SearchParametersState {
  const factory Saved(
      {String? keyword,
      List<int> localities,
      List<int> professions,
      int? education,
      List<int> jobTypes,
      int? experienceLevel}) = _$Saved;

  String? get keyword => throw _privateConstructorUsedError;
  List<int> get localities => throw _privateConstructorUsedError;
  List<int> get professions => throw _privateConstructorUsedError;
  int? get education => throw _privateConstructorUsedError;
  List<int> get jobTypes => throw _privateConstructorUsedError;
  int? get experienceLevel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedCopyWith<Saved> get copyWith => throw _privateConstructorUsedError;
}
