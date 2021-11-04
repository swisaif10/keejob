import 'package:equatable/equatable.dart';
import 'package:keejob_mobile/recruiters/model/recruiter.dart';

abstract class RecruiterState extends Equatable {
  const RecruiterState();

  @override
  List<Object> get props => [];
}

class RecruiterInitial extends RecruiterState {}

class RecruiterLoading extends RecruiterState {}

class RecruiterLoaded extends RecruiterState {
  final Recruiter recruiter;
  RecruiterLoaded(this.recruiter);
}
