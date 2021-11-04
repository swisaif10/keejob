import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiter_event.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiter_state.dart';
import 'package:keejob_mobile/recruiters/service/recruiterService.dart';

class RecruiterBloc extends Bloc<RecruiterEvent, RecruiterState> {
  RecruiterServiceInterface _recruiterService;
  RecruiterBloc(this._recruiterService) : super(RecruiterInitial());

  @override
  Stream<RecruiterState> mapEventToState(
    RecruiterEvent event,
  ) async* {
    if (event is GetRecruiter) {
      yield RecruiterLoading();
      final recruiter =
          await _recruiterService.fetchRecruiter(event.recruiterId);
      yield RecruiterLoaded(recruiter!);
    }
  }
}
