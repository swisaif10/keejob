import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_locality_event.dart';
import 'search_locality_state.dart';
import '../../service/search_locality.dart';

class SearchLocalityBloc
    extends Bloc<SearchLocalityEvent, SearchLocalityListState> {
  SearchLocalityInterface _searchLocalityService;

  SearchLocalityBloc(this._searchLocalityService)
      : super(SearchLocalityListState.initial());

  @override
  Stream<SearchLocalityListState> mapEventToState(
    SearchLocalityEvent event,
  ) async* {
    if (event is GetLocalityList) {
      yield SearchLocalityListState.initial();
      final data = await _searchLocalityService.fetchLocality();
      yield SearchLocalityListState.success(data);
    }
  }
}
