// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteJob _$FavoriteJobFromJson(Map<String, dynamic> json) {
  return FavoriteJob(
    id: json['id'] as int,
    job: Job.fromJson(json['job_details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FavoriteJobToJson(FavoriteJob instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_details': instance.job.toJson(),
    };
