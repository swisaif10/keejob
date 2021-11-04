import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_training_event.dart';
import 'search_training_state.dart';
import '../services/search_training.dart';

class SearchTrainingListBloc
    extends Bloc<SearchTrainingListEvent, SearchTrainingListState> {
  SearchTrainingServiceInterface _searchTrainingService;
  SearchTrainingListBloc(this._searchTrainingService)
      : super(SearchTrainingListState.initial());

  @override
  Stream<SearchTrainingListState> mapEventToState(
    SearchTrainingListEvent event,
  ) async* {
    final SearchTrainingListState currentState = state;
    if (event is GetSearchTrainingList && !_hasReachedMax(currentState)) {
      if ((currentState is Initial) || (currentState is Success)) {
        final data = await _searchTrainingService.fetchTraining(10);
        yield SearchTrainingListState.success(data);
      }
    }
  }

  bool _hasReachedMax(SearchTrainingListState state) => state is Success;
}
