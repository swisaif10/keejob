import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_training_state.freezed.dart';

@freezed
abstract class SearchTrainingListState
    with _$SearchTrainingListState {
  const factory SearchTrainingListState.initial() = Initial;
  const factory SearchTrainingListState.success(List<dynamic> search) =
  Success;
}
