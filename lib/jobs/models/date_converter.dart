import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat('yyyy-MM-dd').parse(json);
  }

  @override
  String toJson(DateTime json) => DateFormat('yyyy-MM-dd').format(json);
}
