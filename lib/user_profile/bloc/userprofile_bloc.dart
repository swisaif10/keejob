import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:keejob_mobile/user_profile/exceptions.dart';
import 'package:keejob_mobile/user_profile/services/userprofile_service.dart';
import './userprofile_event.dart';
import './userprofile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileServiceInterface _userProfileService;
  UserProfileBloc(this._userProfileService)
      : super(UserProfileState.userProfileInitial());

  @override
  Stream<UserProfileState> mapEventToState(
    UserProfileEvent event,
  ) async* {
    if (event is GetUserProfile) {
      yield UserProfileState.userProfileLoading();
      try {
        final _currentUserProfile = await _userProfileService.getUserProfile();
        yield UserProfileState.userProfileLoaded(_currentUserProfile);
      } on UserNotLoggedInException {
        yield UserProfileState.userProfileFailed();
      }
    }
  }
}
