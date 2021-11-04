// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    id: json['id'] as int,
    job: Job.fromJson(json['job_details'] as Map<String, dynamic>),
    applicationDate: const CustomDateTimeConverter()
        .fromJson(json['application_date'] as String),
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_details': instance.job.toJson(),
      'application_date':
          const CustomDateTimeConverter().toJson(instance.applicationDate),
    };
