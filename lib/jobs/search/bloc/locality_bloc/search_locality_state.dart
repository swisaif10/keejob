import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_locality_state.freezed.dart';

@freezed
abstract class SearchLocalityListState with _$SearchLocalityListState {
  const factory SearchLocalityListState.initial() = Initial;
  const factory SearchLocalityListState.success(List<dynamic>? search) =
      Success;
}
