import 'dart:async';

import 'package:bloc/bloc.dart';
import 'search_training_parameters_event.dart';
import 'search_training_parameters_state.dart';

class SearchTrainingParametersBloc
    extends Bloc<SearchTrainingParametersEvent, SearchTrainingParametersState> {
  SearchTrainingParametersBloc()
      : super(SearchTrainingParametersState.initial());

  @override
  Stream<SearchTrainingParametersState> mapEventToState(
      SearchTrainingParametersEvent event,) async* {
    SearchTrainingParametersState currentState = state;

    if (state is Initial) {
      currentState = SearchTrainingParametersState.saved();
    }
    if (event is ResetSearchParameters) {
      yield SearchTrainingParametersState.initial();
    } else if (event is SetKeyword) {
      yield (currentState as Saved).copyWith(keyword: event.keyword);
    } else if (event is SetDomainName) {
      yield (currentState as Saved).copyWith(domainName: event.domainName);
    } else if (event is SetLocality) {
      List<int> localities = (currentState as Saved).localities;
      yield currentState.copyWith(
          localities: List<int>.from(localities)
            ..add(event.locality));
    } else if (event is RemoveLocality) {
      List<int> localities = (currentState as Saved).localities;
      yield currentState.copyWith(
          localities: List<int>.from(localities)
            ..remove(event.locality));
    }
  }
}