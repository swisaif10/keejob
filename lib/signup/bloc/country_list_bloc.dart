import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/signup/bloc/country_list_event.dart';
import 'package:keejob_mobile/signup/bloc/country_list_state.dart';
import 'package:keejob_mobile/signup/service/country-service.dart';

class CountryListBloc extends Bloc<CountryListEvent, CountryListState> {
  CountryServiceInterface _countryService;
  CountryListBloc(this._countryService) : super(CountryListState.initial());

  @override
  Stream<CountryListState> mapEventToState(
    CountryListEvent event,
  ) async* {
    final currentState = state;
    if (event is GetCountryList && !_hasReachedMax(currentState)) {
      if ((currentState is Initial) || (currentState is Success)) {
        final data = await _countryService.fetchCountry();
        yield CountryListState.success(data);
      }
    }
  }

  bool _hasReachedMax(CountryListState state) => state is Success;
}
