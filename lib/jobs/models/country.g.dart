// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    code: json['code'] as int,
    name: json['name'] as String,
    alpah2Code: json['alpah2_code'] as String?,
    callingCode: json['calling_code'] as int,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'alpah2_code': instance.alpah2Code,
      'calling_code': instance.callingCode,
    };
