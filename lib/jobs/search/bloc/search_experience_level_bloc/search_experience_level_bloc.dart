import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import './search_experience_level_event.dart';
import './search_experience_level_state.dart';
import '../../service/search_experience_level.dart';

class SearchExperienceLevelBloc
    extends Bloc<SearchExperienceLevelEvent, SearchExperienceLevelListState> {
  SearchExperienceLevelInterface _searchExperienceLevelService;
  SearchExperienceLevelBloc(this._searchExperienceLevelService)
      : super(SearchExperienceLevelListState.initial());

  @override
  Stream<SearchExperienceLevelListState> mapEventToState(
    SearchExperienceLevelEvent event,
  ) async* {
    if (event is GetExperienceLevelList) {
      yield SearchExperienceLevelListState.initial();
      final data = await _searchExperienceLevelService.fetchExperienceLevel();
      yield SearchExperienceLevelListState.success(data);
    }
  }
}
