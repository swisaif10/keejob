// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recruiter _$RecruiterFromJson(Map<String, dynamic> json) {
  return Recruiter(
    id: json['id'] as int,
    logo: json['logo'] as String?,
    companyName: json['company_name'] as String?,
    category: json['category'] as String?,
    address: json['address'] as String?,
    city: json['city'] as String?,
    description: json['description'] as String?,
    region: json['region'] as String?,
  );
}

Map<String, dynamic> _$RecruiterToJson(Recruiter instance) => <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'company_name': instance.companyName,
      'category': instance.category,
      'address': instance.address,
      'city': instance.city,
      'description': instance.description,
      'region': instance.region,
    };
