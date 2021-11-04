// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recruiter _$RecruiterFromJson(Map<String, dynamic> json) {
  return Recruiter(
    id: json['id'] as int?,
    logo: json['logo'] as String?,
    country: json['country'] == null
        ? null
        : Country.fromJson(json['country'] as Map<String, dynamic>),
    companyName: json['company_name'] as String?,
    category: json['category'] as String?,
    address: json['address'] as String?,
    city: json['city'] as String?,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$RecruiterToJson(Recruiter instance) => <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'country': instance.country?.toJson(),
      'company_name': instance.companyName,
      'category': instance.category,
      'address': instance.address,
      'city': instance.city,
      'description': instance.description,
    };
