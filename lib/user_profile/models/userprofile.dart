import 'package:equatable/equatable.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class UserProfile extends Equatable {
  final int id;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final DateTime? birthDate;
  final String? country;
  final List<String> phoneNumbers;
  final String? photo;
  final String? profileTitle;
  final String? degreeLevel;
  final String? region;
  final DateTime? totalExperiences;
  final List<String> experiences;

  UserProfile(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.birthDate,
      required this.country,
      required this.phoneNumbers,
      required this.photo,
      required this.profileTitle,
      required this.degreeLevel,
      required this.region,
      required this.totalExperiences,
      required this.experiences});

  String get experienceDurationText {
    if (totalExperiences != null) {
      final now = DateTime.now();

      int years = now.year - totalExperiences!.year;
      int months = now.month - totalExperiences!.month;
      int days = now.day - totalExperiences!.day;

      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += days < 0 ? 11 : 12;
      }
      String result = '';
      if (years > 0) result += '$years années';
      if (months > 0) result += ', $months mois';
      return result;
    }
    return '';
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        gender,
        birthDate,
        country,
        phoneNumbers,
        region,
        photo,
        experiences
      ];

  String get userPhoto {
    if (photo == null) {
      return '';
    }
    return photo!;
  }

  Future<PhoneNumber?> getFirstPhoneNumber() async {
    if (phoneNumbers.isEmpty) {
      return null;
    }
    final phoneNumber = phoneNumbers[0];
    return await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);

  }
}
