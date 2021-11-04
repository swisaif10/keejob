// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Training _$TrainingFromJson(Map<String, dynamic> json) {
  return Training(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    region: json['region'] as String?,
    recruiter:
        RecruiterTraining.fromJson(json['recruiter'] as Map<String, dynamic>),
    price: json['price'] as String?,
    duration: json['duration'] as String?,
    logo: json['logo'] as String?,
    publicationDate: const CustomDateTimeConverter()
        .fromJson(json['publication_date'] as String),
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$TrainingToJson(Training instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'recruiter': instance.recruiter.toJson(),
      'region': instance.region,
      'price': instance.price,
      'duration': instance.duration,
      'logo': instance.logo,
      'publication_date':
          const CustomDateTimeConverter().toJson(instance.publicationDate),
      'url': instance.url,
    };
