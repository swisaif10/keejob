import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:keejob_mobile/jobs/models/job.dart';

part 'jobs_list_state.freezed.dart';

@freezed
abstract class JobsListState with _$JobsListState {
  const factory JobsListState.initial() = Initial;
  const factory JobsListState.success(List<Job>? jobs, int? nextPageNumber) =
      Success;
}
