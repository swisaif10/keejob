import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchExperienceLevelEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetExperienceLevelList extends SearchExperienceLevelEvent {}
