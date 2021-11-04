import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_education_level_state.freezed.dart';

@freezed
abstract class SearchEducationLevelListState
    with _$SearchEducationLevelListState {
  const factory SearchEducationLevelListState.initial() = Initial;
  const factory SearchEducationLevelListState.success(
      Map<String, dynamic>? search) = Success;
}
