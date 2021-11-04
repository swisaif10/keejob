import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchTrainingListEvent extends Equatable {
  const SearchTrainingListEvent();

  @override
  List<Object> get props => [];
}

class GetSearchTrainingList extends SearchTrainingListEvent {}
