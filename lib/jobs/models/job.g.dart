// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    id: json['id'] as int?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    recruiter: json['recruiter'] == null
        ? null
        : Recruiter.fromJson(json['recruiter'] as Map<String, dynamic>),
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    region: json['region'] as String?,
    city: json['city'] as String?,
    address: json['address'] as String?,
    educationLevel: json['education_level'] as String?,
    experienceLevel: json['experience_level'] as String?,
    publicationDate: json['publication_date'] == null
        ? null
        : DateTime.parse(json['publication_date'] as String),
    jobTypes: json['job_types'] as String?,
    alreadyApplied: json['already_applied'] as bool,
    isFavorite: json['is_favorite'] as bool,
    jobStatus: json['job_status'] as String?,
    url: json['url'] as String?,
    format: json['format'] as int?,
    min_salary: (json['min_salary'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'country': instance.country?.toJson(),
      'region': instance.region,
      'city': instance.city,
      'address': instance.address,
      'education_level': instance.educationLevel,
      'experience_level': instance.experienceLevel,
      'publication_date': instance.publicationDate?.toIso8601String(),
      'recruiter': instance.recruiter?.toJson(),
      'job_types': instance.jobTypes,
      'already_applied': instance.alreadyApplied,
      'job_status': instance.jobStatus,
      'url': instance.url,
      'min_salary': instance.min_salary,
      'format': instance.format,
      'is_favorite': instance.isFavorite,
    };
