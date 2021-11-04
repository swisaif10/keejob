import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TrainingListEvent extends Equatable {
  const TrainingListEvent();

  @override
  List<Object> get props => [];
}

class GetTrainingList extends TrainingListEvent {}

class RefreshTrainingsList extends TrainingListEvent {}