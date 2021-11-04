import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import './search_profession_event.dart';
import './search_profession_state.dart';
import '../../service/search_profession.dart';

class SearchProfessionListBloc
    extends Bloc<SearchProfessionListEvent, SearchProfessionListState> {
  SearchProfessionServiceInterface _searchProfessionService;
  SearchProfessionListBloc(this._searchProfessionService)
      : super(SearchProfessionListState.initial());

  @override
  Stream<SearchProfessionListState> mapEventToState(
    SearchProfessionListEvent event,
  ) async* {
    if (event is GetSearchProfessionList) {
      yield SearchProfessionListState.initial();
      final data = await _searchProfessionService.fetchProfession();
      yield SearchProfessionListState.success(data);
    }
  }
}
