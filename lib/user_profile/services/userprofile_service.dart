import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/user_profile/exceptions.dart';
import '../models/userprofile.dart';

abstract class UserProfileServiceInterface {
  Future<UserProfile> getUserProfile();
}

class UserProfileService extends UserProfileServiceInterface {
  final Dio dio;

  UserProfileService(this.dio);

  @override
  Future<UserProfile> getUserProfile() async {
    try {
      final response = await dio.get(
        AppConfig.JOBSEEKER_PROFILE,
      );
      final responseData = response.data;
      return UserProfile(
        id: responseData['id'],
        email: responseData['email'],
        firstName: responseData['first_name'],
        lastName: responseData['last_name'],
        country: responseData['country']?['name'],
        photo: responseData['photo'],
        gender: responseData['gender'],
        region: responseData['region'],
        experiences: (responseData['experiences'] as List)
          .map((s) => s as String)
          .toList(),
        phoneNumbers: (responseData['phone_numbers'] as List)
            .map((s) => s as String)
            .toList(),
        birthDate: responseData['birth_date'] != null
            ? DateFormat('yyyy-MM-dd').parse(responseData['birth_date'])
            : null,
        profileTitle: responseData['profile_title'],
        degreeLevel: responseData['degree_level'],
        totalExperiences: responseData['total_experiences'] != null
            ? DateFormat('yyyy-MM-dd').parse(responseData['total_experiences'])
            : null,
      );
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        throw UserNotLoggedInException();
      } else {
        rethrow;
      }
    } catch (error) {
      rethrow;
    }
  }
}
