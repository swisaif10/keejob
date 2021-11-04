import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'sub_profession.dart';

part 'profession.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Profession extends Equatable {
  final int id;
  final String name;
  final String slug;
  final bool is_category;
  final String description;
  final List<SubProfession> sub_professions;

  Profession({
    required this.id,
    required this.name,
    required this.slug,
    required this.is_category,
    required this.description,
    required this.sub_professions,
  });

  @override
  List<Object> get props =>
      [id, name, slug, is_category, description, sub_professions];

  factory Profession.fromJson(Map<String, dynamic> json) =>
      _$ProfessionFromJson(json);
  Map<String, dynamic> toJson() => _$ProfessionToJson(this);

  String get professionDescription {
    if (description.isEmpty) {
      return '';
    }
    return description;
  }

  String get professioName {
    if (name.isEmpty) {
      return '';
    }
    return name;
  }

  String get professionSlug {
    if (slug.isEmpty) {
      return '';
    }
    return slug;
  }
}
