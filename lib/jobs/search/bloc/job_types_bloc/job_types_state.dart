import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_types_state.freezed.dart';

@freezed
abstract class SearchJobTypesListState with _$SearchJobTypesListState {
  const factory SearchJobTypesListState.initial() = Initial;
  const factory SearchJobTypesListState.success(Map<String, dynamic>? search) = Success;
}
