import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:keejob_mobile/jobs/services/jobs_service.dart';
import '../models/job.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobsServiceInterface _jobService;
  JobBloc(this._jobService) : super(JobInitial());

  @override
  Stream<JobState> mapEventToState(
    JobEvent event,
  ) async* {
    if (event is GetJob) {
      yield JobLoading();
      final job = await _jobService.fetchJob(event.jobId);
      yield JobLoaded(job!);
    }
  }
}
