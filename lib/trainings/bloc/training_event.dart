import 'package:equatable/equatable.dart';


abstract class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object> get props => [];
}

class GetTraining extends TrainingEvent {
  final int trainingId;
  GetTraining(this.trainingId);
}