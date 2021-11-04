
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RecruitersListEvent extends Equatable {
  const RecruitersListEvent();

  @override
  List<Object> get props => [];
}

class GetRecruitersList extends RecruitersListEvent {}
