import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_experience_level_state.freezed.dart';

@freezed
abstract class SearchExperienceLevelListState
    with _$SearchExperienceLevelListState {
  const factory SearchExperienceLevelListState.initial() = Initial;
  const factory SearchExperienceLevelListState.success(Map<String, dynamic>? search) =
      Success;
}
