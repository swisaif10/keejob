import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/trainings/models/training.dart';

part 'training_list_state.freezed.dart';

@freezed
abstract class TrainingListState with _$TrainingListState {
  const factory TrainingListState.initial() = Initial;
  const factory TrainingListState.success(List<Training>? training, int? nextPageNumber) = Success;
}
