import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:keejob_mobile/config/app_config.dart';

part 'recruiter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class RecruiterTraining extends Equatable {
  final int id;
  final String? logo;
  final String companyName;
  final String? category;
  final String? address;
  final String? city;
  final String? description;

  RecruiterTraining({
    required this.id,
    required this.logo,
    required this.companyName,
    required this.category,
    required this.address,
    required this.city,
    required this.description,
  });

  factory RecruiterTraining.fromJson(Map<String, dynamic> json) =>
      _$RecruiterTrainingFromJson(json);
  Map<String, dynamic> toJson() => _$RecruiterTrainingToJson(this);

  @override
  List<Object> get props => [
        id,
        logo ?? '',
        companyName,
        category ?? '',
        address ?? '',
        city ?? '',
        description ?? ''
      ];

  String get logoImage {
    return logo ?? AppConfig.DEFAULT_RECRUITER_IMG;
  }

  String get name {
    if (companyName.isEmpty) {
      return 'Anonyme';
    }
    return companyName;
  }

  String get recruiterAddress {
    return address ?? '';
  }

  String get recruiterCity {
    return city ?? '';
  }

  String get recruiterDescription {
    return description ?? '';
  }

  String get recruiterCategory {
    return category ?? '';
  }
}
