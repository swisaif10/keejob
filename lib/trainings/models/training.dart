import 'package:equatable/equatable.dart';
import 'package:keejob_mobile/trainings/models/recruiter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:keejob_mobile/jobs/models/date_converter.dart';

part 'training.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@CustomDateTimeConverter()
class Training extends Equatable {
  final int id;
  final String title;
  final String description;
  final RecruiterTraining recruiter;
  final String? region;
  final String? price;
  final String? duration;
  final String? logo;
  final DateTime publicationDate;
  final String url;

  Training({
    required this.id,
    required this.title,
    required this.description,
    required this.region,
    required this.recruiter,
    required this.price,
    required this.duration,
    required this.logo,
    required this.publicationDate,
    required this.url,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        region ?? '',
        recruiter,
        price ?? '',
        duration ?? '',
        logo ?? '',
        publicationDate,
        url
      ];

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);
  Map<String, dynamic> toJson() => _$TrainingToJson(this);

  String get trainingDescription {
    if (description.isEmpty) {
      return '';
    }
    return description;
  }

  String get trainingTitle {
    if (title.isEmpty) {
      return '';
    }
    return title;
  }

  DateTime? get trainingPublicationDate {
    if (publicationDate.toString().isEmpty) {
      return null;
    }
    return publicationDate;
  }

  String get trainingPrice {
    return price ?? '';
  }

  String get trainingDuration {
    return duration ?? '';
  }

  String get trainingRegion {
    return region ?? '';
  }

  String get priceWithUnit {
    if (price != null) {
      return '$price DT';
    }
    return '';
  }
}
