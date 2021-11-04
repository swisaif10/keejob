import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import './search_education_level_event.dart';
import './search_education_level_state.dart';
import '../../service/search_education_level.dart';

class SearchEducationLevelBloc
    extends Bloc<SearchEducationLevelEvent, SearchEducationLevelListState> {
  SearchEducationLevelServiceInterface _searchEducationLevelService;
  SearchEducationLevelBloc(this._searchEducationLevelService)
      : super(SearchEducationLevelListState.initial());

  @override
  Stream<SearchEducationLevelListState> mapEventToState(
    SearchEducationLevelEvent event,
  ) async* {
    if (event is GetEducationLevelList) {
      yield SearchEducationLevelListState.initial();
      final data = await _searchEducationLevelService.fetchEducationLevel();
      yield SearchEducationLevelListState.success(data);
    }
  }
}
