import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/applications/models/application.dart';

part 'application_state.freezed.dart';

@freezed
abstract class ApplicationListState with _$ApplicationListState {
  const factory ApplicationListState.initial() = ApplicationListInitial;
  const factory ApplicationListState.loading() = ApplicationListLoading;
  const factory ApplicationListState.success(List<Application>? applications) =
      ApplicationListSuccess;
}
