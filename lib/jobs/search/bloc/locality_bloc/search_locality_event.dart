import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SearchLocalityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLocalityList extends SearchLocalityEvent {}
