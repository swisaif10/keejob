import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'search_training_parameters_state.freezed.dart';

@freezed
abstract class SearchTrainingParametersState with _$SearchTrainingParametersState {
  const factory SearchTrainingParametersState.initial() = Initial;
  const factory SearchTrainingParametersState.saved(
      {
        String? keyword,
      int? domainName,
        @Default([]) List<int> localities,

      }) = Saved;
}
