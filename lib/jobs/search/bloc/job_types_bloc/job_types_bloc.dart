import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import './job_types_event.dart';
import './job_types_state.dart';
import '../../service/search_job_types.dart';

class SearchJobTypesBloc
    extends Bloc<SearchJobTypesEvent, SearchJobTypesListState> {
  SearchJobTypesInterface _searchJobTypesService;
  SearchJobTypesBloc(this._searchJobTypesService)
      : super(SearchJobTypesListState.initial());

  @override
  Stream<SearchJobTypesListState> mapEventToState(
    SearchJobTypesEvent event,
  ) async* {
    if (event is GetJobTypesList) {
      yield SearchJobTypesListState.initial();
      final data = await _searchJobTypesService.fetchJobTypes();
      yield SearchJobTypesListState.success(data);
    }
  }
}
