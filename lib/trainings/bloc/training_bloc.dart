import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keejob_mobile/trainings/bloc/training_event.dart';
import '../models/training.dart';
import '../services/trainings_service.dart';

part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingsServiceInterface? _trainingService;
  TrainingBloc(this._trainingService) : super(TrainingInitial());

  @override
  Stream<TrainingState> mapEventToState(
    TrainingEvent event,
  ) async* {
    if (event is GetTraining) {
      yield TrainingLoading();
      final training = await _trainingService!.fetchTraining(event.trainingId);
      yield TrainingLoaded(training);
    }
  }
}
