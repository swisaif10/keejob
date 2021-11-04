import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:keejob_mobile/jobs/models/country.dart';
import 'package:keejob_mobile/jobs/models/date_converter.dart';
import 'package:keejob_mobile/jobs/models/recruiter.dart';

part 'job.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@CustomDateTimeConverter()

class Job extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final Country? country;
  final String? region;
  final String? city;
  final String? address;
  final String? educationLevel;
  final String? experienceLevel;
  final DateTime? publicationDate;
  final Recruiter? recruiter;
  final String? jobTypes;
  final bool alreadyApplied;
  final String? jobStatus;
  final String? url;
  final double? min_salary;
  final int? format;
  late bool isFavorite;

  Job(
      {required this.id,
      required this.title,
      required this.description,
      required this.recruiter,
      required this.country,
      required this.region,
      required this.city,
      required this.address,
      required this.educationLevel,
      required this.experienceLevel,
      required this.publicationDate,
      required this.jobTypes,
      required this.alreadyApplied,
      required this.isFavorite,
      required this.jobStatus,
      required this.url,
      required this.format,
      required this.min_salary});

  String get location {
    String result = '';
    if (region != '' && region != null) {
      result += region!;
    } else if (city != '' && city != null) {
      if (result != '') {
        result += ' / ';
      }
      result += city!;
    }
    return result;
  }

  @override
  List<Object> get props => [
        id!,
        title!,
        description!,
        recruiter!,
        country!,
        region!,
        city!,
        educationLevel!,
        experienceLevel!,
        publicationDate!,
        jobTypes!,
        isFavorite,
        alreadyApplied,
        jobStatus!,
        url!,
        format!,
        min_salary!
      ];

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);

  String get jobDescription {
    if (description == null) {
      return '';
    }
    return description!;
  }

  String get jobTitle {
    if (title == null) {
      return '';
    }
    return title!;
  }

  String get jobRegion {
    if (region == null) {
      return ' ';
    }
    return region!;
  }

  Recruiter? get getRecruiter {
    if (recruiter == null) {
      return null;
    }
    return recruiter;
  }

  Country? get getCountry {
    if (country == null) {
      return null;
    }
    return country;
  }

  String get jobCity {
    if (city == null) {
      return '';
    }
    return city!;
  }

  String get jobEducationLevel {
    if (educationLevel == null) {
      return '';
    }
    return educationLevel!;
  }

  String get jobExperienceLevel {
    if (experienceLevel == null) {
      return '';
    }
    if (experienceLevel!.startsWith('Entre')) {
      var exp = experienceLevel!.substring(6, experienceLevel!.length);
      var x = exp.replaceRange(2, 4, 'à');
      return x;
    } else
      return experienceLevel!;
  }

  DateTime? get jobPublicationDate {

    if (publicationDate == null) {
      return null;
    }
    return publicationDate;
  }

  String get jobType {
    if (jobTypes == null) {
      return '';
    }
    return jobTypes!;
  }

  String get jobAddress {
    if (address == null) {
      return '';
    }
    return address!;
  }

  String get regionText {
    return [jobCity, jobRegion].where((element) => element != '').join(', ');
  }

  @override
  String toString() {
    return '$id $title';
  }
}
