import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/user_profile/models/userprofile.dart';

part 'userprofile_state.freezed.dart';

@freezed
abstract class UserProfileState with _$UserProfileState {
  const factory UserProfileState.userProfileInitial() = UserProfileInitial;
  const factory UserProfileState.userProfileLoading() = UserProfileLoadinf;
  const factory UserProfileState.userProfileFailed() = UserProfileFailed;
  const factory UserProfileState.userProfileLoaded(UserProfile userProfile) =
      UserProfileLoaded;
}
