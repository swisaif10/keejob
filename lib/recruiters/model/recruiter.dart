import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:keejob_mobile/config/app_config.dart';

part 'recruiter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Recruiter extends Equatable {
  final int id;
  final String? logo;
  final String? companyName;
  final String? category;
  final String? address;
  final String? city;
  final String? description;
  final String? region;

  Recruiter({
    required this.id,
    required this.logo,
    required this.companyName,
    required this.category,
    required this.address,
    required this.city,
    required this.description,
    required this.region,
  });

  @override
  List<Object> get props => [
        id,
      ];

  factory Recruiter.fromJson(Map<String, dynamic> json) =>
      _$RecruiterFromJson(json);
  Map<String, dynamic> toJson() => _$RecruiterToJson(this);

  String get logoImage {
    if (logo == null) {
      return AppConfig.DEFAULT_RECRUITER_IMG;
    }
    return logo!;
  }

  String get recruiteName {
    if (companyName == null) {
      return 'Anonyme';
    }
    return companyName!;
  }

  String get recruiterAddress {
    if (address == null) {
      return '';
    }
    return address!;
  }

  String get recruiterCity {
    if (city == null) {
      return '';
    }
    return city!;
  }

  String get recruiterDescription {
    if (description == null) {
      return '';
    }
    return description!;
  }

  String get recruiterCategory {
    if (category == null) {
      return '';
    }
    return category!;
  }

  String get recruiterRegion {
    if (region == null) {
      return '';
    }
    return region!;
  }
}
