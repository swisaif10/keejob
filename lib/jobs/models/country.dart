import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Country extends Equatable {
  final int code;
  final String name;
  final String? alpah2Code;
  final int callingCode;

  Country({
    required this.code,
    required this.name,
    required this.alpah2Code,
    required this.callingCode,
  });

  @override
  List<Object> get props => [
        code,
        name,
        alpah2Code!,
        callingCode,
      ];

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);


  String get jobName {
    if (name.isEmpty) {
      return '';
    }
    return name;
  }
}
