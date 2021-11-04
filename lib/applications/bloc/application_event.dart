import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ApplicationListEvent extends Equatable {
  const ApplicationListEvent();

  @override
  List<Object> get props => [];
}

class GetApplicationList extends ApplicationListEvent {}
