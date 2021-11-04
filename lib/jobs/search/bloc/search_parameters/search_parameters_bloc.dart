import 'dart:async';

import 'package:bloc/bloc.dart';
import './search_parameters_event.dart';
import './search_parameters_state.dart';

class SearchParametersBloc
    extends Bloc<SearchParametersEvent, SearchParametersState> {
  SearchParametersBloc() : super(SearchParametersState.initial());

  @override
  Stream<SearchParametersState> mapEventToState(
    SearchParametersEvent event,
  ) async* {
    SearchParametersState currentState = state;
    if (state is Initial) {
      currentState = SearchParametersState.saved();
    }
    if (event is ResetSearchParameters) {
      yield SearchParametersState.initial();
    } else if (event is SetKeyword) {
      yield (currentState as Saved).copyWith(keyword: event.keyword);
    } else if (event is SetEducation) {
      yield (currentState as Saved).copyWith(education: event.education);
    } else if (event is SetExperienceLevel) {
      yield (currentState as Saved)
          .copyWith(experienceLevel: event.experienceLevel);
    } else if (event is SetLocality) {
      List<int> localities = (currentState as Saved).localities;
      yield currentState.copyWith(
          localities: List<int>.from(localities)..add(event.locality));
    } else if (event is RemoveLocality) {
      List<int> localities = (currentState as Saved).localities;
      yield currentState.copyWith(
          localities: List<int>.from(localities)..remove(event.locality));
    } else if (event is SetProfession) {
      List<int> professions = (currentState as Saved).professions;
      yield currentState.copyWith(
          professions: List<int>.from(professions)..add(event.profession));
    } else if (event is RemoveProfession) {
      List<int> professions = (currentState as Saved).professions;
      yield currentState.copyWith(
          professions: List<int>.from(professions)..remove(event.profession));
    } else if (event is SetJobType) {
      List<int> jobTypes = (currentState as Saved).jobTypes;
      yield currentState.copyWith(
          jobTypes: List<int>.from(jobTypes)..add(event.jobType));
    } else if (event is RemoveJobType) {
      List<int> jobTypes = (currentState as Saved).jobTypes;
      yield currentState.copyWith(
          jobTypes: List<int>.from(jobTypes)..remove(event.jobType));
    }
  }
}
