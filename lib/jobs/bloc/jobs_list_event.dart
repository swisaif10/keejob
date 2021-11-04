part of 'jobs_list_bloc.dart';

@immutable
abstract class JobsListEvent extends Equatable {
  const JobsListEvent();

  @override
  List<Object> get props => [];
}

class GetJobsList extends JobsListEvent {}

class RefreshJobsList extends JobsListEvent {}
