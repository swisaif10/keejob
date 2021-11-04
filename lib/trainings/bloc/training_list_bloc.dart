import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_event.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_state.dart';
import 'package:keejob_mobile/trainings/services/trainings_service.dart';

class TrainingListBloc extends Bloc<TrainingListEvent, TrainingListState> {
  TrainingsServiceInterface _trainingService;
  TrainingListBloc(this._trainingService) : super(TrainingListState.initial());

  @override
  Stream<TrainingListState> mapEventToState(
    TrainingListEvent event,
  ) async* {
    final TrainingListState currentState = state;
    if (event is GetTrainingList && !_hasReachedMax(currentState)) {
      if (currentState is Initial) {
        final trainingsData = await _trainingService.fetchTrainings(10, 1);
        final trainingsList = trainingsData.item2;
        final nextPageNumber = trainingsData.item1;
        yield TrainingListState.success(trainingsList, nextPageNumber);
      } else if (currentState is Success) {
        final trainingsData = await _trainingService.fetchTrainings(
            10, currentState.nextPageNumber!);
        final trainingsList = trainingsData.item2;
        final nextPageNumber = trainingsData.item1;
        print(trainingsList.first.region);
        yield TrainingListState.success(
            currentState.training! + trainingsList, nextPageNumber);
      }
    } else if (event is RefreshTrainingsList) {
      yield TrainingListState.initial();
      add(GetTrainingList());
    }
  }

  bool _hasReachedMax(TrainingListState state) =>
      state is Success && state.nextPageNumber == 0;
}
