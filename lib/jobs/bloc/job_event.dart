part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];
}

class GetJob extends JobEvent {
  final int jobId;
  GetJob(this.jobId);
}
