import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/applications/bloc/application_event.dart';
import 'package:keejob_mobile/applications/bloc/application_state.dart';
import '../services/application_service.dart';

class ApplicationListBloc
    extends Bloc<ApplicationListEvent, ApplicationListState> {
  final ApplicationServiceInterface _applicationervice;

  ApplicationListBloc(this._applicationervice)
      : super(ApplicationListState.initial());

  @override
  Stream<ApplicationListState> mapEventToState(
    ApplicationListEvent event,
  ) async* {
    yield ApplicationListState.loading();
    final applications = await _applicationervice.fetchApplications();
    yield ApplicationListState.success(applications);
  }
}
