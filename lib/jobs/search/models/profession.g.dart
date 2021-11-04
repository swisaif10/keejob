// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profession _$ProfessionFromJson(Map<String, dynamic> json) {
  return Profession(
    id: json['id'] as int,
    name: json['name'] as String,
    slug: json['slug'] as String,
    is_category: json['is_category'] as bool,
    description: json['description'] as String,
    sub_professions: (json['sub_professions'] as List<dynamic>)
        .map((e) => SubProfession.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProfessionToJson(Profession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'is_category': instance.is_category,
      'description': instance.description,
      'sub_professions':
          instance.sub_professions.map((e) => e.toJson()).toList(),
    };
