import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_list_state.freezed.dart';

@freezed
abstract class CountryListState with _$CountryListState {
  const factory  CountryListState.initial() = Initial;
  const factory CountryListState.success(List<dynamic> search) =
      Success;
}
