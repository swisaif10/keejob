import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchJobTypesEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class GetJobTypesList extends SearchJobTypesEvent {}



