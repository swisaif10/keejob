// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_profession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubProfession _$SubProfessionFromJson(Map<String, dynamic> json) {
  return SubProfession(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$SubProfessionToJson(SubProfession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
    };
