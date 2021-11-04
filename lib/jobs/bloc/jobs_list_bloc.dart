import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import '../services/jobs_service.dart';
import 'jobs_list_state.dart';

part 'jobs_list_event.dart';

class JobsListBloc extends Bloc<JobsListEvent, JobsListState> {
  JobsServiceInterface _jobService;
  JobsListBloc(this._jobService) : super(JobsListState.initial());

  @override
  void onEvent(JobsListEvent event) {
    super.onEvent(event);
    print('Event came $event');
  }

  @override
  Stream<Transition<JobsListEvent, JobsListState>> transformEvents(
    Stream<JobsListEvent> events,
    TransitionFunction<JobsListEvent, JobsListState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<JobsListState> mapEventToState(
    JobsListEvent event,
  ) async* {
    final JobsListState currentState = state;
    if (event is GetJobsList && !_hasReachedMax(currentState)) {
      if (currentState is Initial) {
        final jobsData = await _jobService.fetchJobs(10, 1);
        final jobsList = jobsData.item2;
        final nextPageNumber = jobsData.item1;
        yield JobsListState.success(jobsList, nextPageNumber);
      } else if (currentState is Success) {
        final jobsData =
            await _jobService.fetchJobs(10, currentState.nextPageNumber ?? 0);
        final jobsList = jobsData.item2;
        final nextPageNumber = jobsData.item1;
        yield JobsListState.success(
            currentState.jobs! + jobsList, nextPageNumber);
      }
    } else if (event is RefreshJobsList) {
      yield JobsListState.initial();
      add(GetJobsList());
    }
  }

  bool _hasReachedMax(JobsListState state) =>
      state is Success && state.nextPageNumber == 0;
}
