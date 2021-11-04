import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiters_list_event.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiters_list_state.dart';
import 'package:keejob_mobile/recruiters/service/recruiterService.dart';
import 'package:rxdart/rxdart.dart';

class RecruitersListBloc
    extends Bloc<RecruitersListEvent, RecruitersListState> {
  RecruiterServiceInterface _recruiterService;
  RecruitersListBloc(this._recruiterService)
      : super(RecruitersListState.initial());

  @override
  Stream<Transition<RecruitersListEvent, RecruitersListState>> transformEvents(
    Stream<RecruitersListEvent> events,
    TransitionFunction<RecruitersListEvent, RecruitersListState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<RecruitersListState> mapEventToState(
    RecruitersListEvent event,
  ) async* {
    final RecruitersListState currentState = state;
    if (event is GetRecruitersList && !_hasReachedMax(currentState)) {
      if (currentState is Initial) {
        final recruitersData =
            await _recruiterService.fetchRecruiters(null, 10);
        final recruitersList = recruitersData.item2;
        final nextUrl = recruitersData.item1;
        yield RecruitersListState.success(recruitersList, nextUrl!);
      } else if (currentState is Success) {
        final recruitersData =
            await _recruiterService.fetchRecruiters(currentState.nextUrl, 10);
        final recruitersList = recruitersData.item2;
        final nextUrl = recruitersData.item1;
        yield RecruitersListState.success(
          currentState.recruiters + recruitersList,
          nextUrl!,
        );
      }
    }
  }

  bool _hasReachedMax(RecruitersListState state) =>
      state is Success && state.nextUrl.isEmpty ;
}
