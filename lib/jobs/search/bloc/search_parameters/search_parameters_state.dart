import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'search_parameters_state.freezed.dart';

@freezed
abstract class SearchParametersState with _$SearchParametersState {
  const factory SearchParametersState.initial() = Initial;
  const factory SearchParametersState.saved(
      {String? keyword,
      @Default([]) List<int> localities,
      @Default([]) List<int> professions,
      int? education,
      @Default([]) List<int> jobTypes,
      int? experienceLevel}) = Saved;
}
