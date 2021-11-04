import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/recruiters/model/recruiter.dart';

part 'recruiters_list_state.freezed.dart';

@freezed
abstract class RecruitersListState with _$RecruitersListState {
  const factory RecruitersListState.initial() = Initial;
  const factory RecruitersListState.success(
      List<Recruiter> recruiters, String nextUrl) = Success;
}
