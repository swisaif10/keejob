// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_training_parameters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchTrainingParametersStateTearOff {
  const _$SearchTrainingParametersStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Saved saved(
      {String? keyword, int? domainName, List<int> localities = const []}) {
    return Saved(
      keyword: keyword,
      domainName: domainName,
      localities: localities,
    );
  }
}

/// @nodoc
const $SearchTrainingParametersState = _$SearchTrainingParametersStateTearOff();

/// @nodoc
mixin _$SearchTrainingParametersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String? keyword, int? domainName, List<int> localities)
        saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? keyword, int? domainName, List<int> localities)?
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
abstract class $SearchTrainingParametersStateCopyWith<$Res> {
  factory $SearchTrainingParametersStateCopyWith(
          SearchTrainingParametersState value,
          $Res Function(SearchTrainingParametersState) then) =
      _$SearchTrainingParametersStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchTrainingParametersStateCopyWithImpl<$Res>
    implements $SearchTrainingParametersStateCopyWith<$Res> {
  _$SearchTrainingParametersStateCopyWithImpl(this._value, this._then);

  final SearchTrainingParametersState _value;
  // ignore: unused_field
  final $Res Function(SearchTrainingParametersState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$SearchTrainingParametersStateCopyWithImpl<$Res>
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
    return 'SearchTrainingParametersState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'SearchTrainingParametersState.initial'));
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
            String? keyword, int? domainName, List<int> localities)
        saved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? keyword, int? domainName, List<int> localities)?
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

abstract class Initial implements SearchTrainingParametersState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $SavedCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
  $Res call({String? keyword, int? domainName, List<int> localities});
}

/// @nodoc
class _$SavedCopyWithImpl<$Res>
    extends _$SearchTrainingParametersStateCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? domainName = freezed,
    Object? localities = freezed,
  }) {
    return _then(Saved(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      domainName: domainName == freezed
          ? _value.domainName
          : domainName // ignore: cast_nullable_to_non_nullable
              as int?,
      localities: localities == freezed
          ? _value.localities
          : localities // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
class _$Saved with DiagnosticableTreeMixin implements Saved {
  const _$Saved({this.keyword, this.domainName, this.localities = const []});

  @override
  final String? keyword;
  @override
  final int? domainName;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> localities;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchTrainingParametersState.saved(keyword: $keyword, domainName: $domainName, localities: $localities)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchTrainingParametersState.saved'))
      ..add(DiagnosticsProperty('keyword', keyword))
      ..add(DiagnosticsProperty('domainName', domainName))
      ..add(DiagnosticsProperty('localities', localities));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Saved &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality()
                    .equals(other.keyword, keyword)) &&
            (identical(other.domainName, domainName) ||
                const DeepCollectionEquality()
                    .equals(other.domainName, domainName)) &&
            (identical(other.localities, localities) ||
                const DeepCollectionEquality()
                    .equals(other.localities, localities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(keyword) ^
      const DeepCollectionEquality().hash(domainName) ^
      const DeepCollectionEquality().hash(localities);

  @JsonKey(ignore: true)
  @override
  $SavedCopyWith<Saved> get copyWith =>
      _$SavedCopyWithImpl<Saved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String? keyword, int? domainName, List<int> localities)
        saved,
  }) {
    return saved(keyword, domainName, localities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? keyword, int? domainName, List<int> localities)?
        saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(keyword, domainName, localities);
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

abstract class Saved implements SearchTrainingParametersState {
  const factory Saved(
      {String? keyword, int? domainName, List<int> localities}) = _$Saved;

  String? get keyword => throw _privateConstructorUsedError;
  int? get domainName => throw _privateConstructorUsedError;
  List<int> get localities => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedCopyWith<Saved> get copyWith => throw _privateConstructorUsedError;
}
