import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_profession.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SubProfession extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String description;

  SubProfession({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
  });

  @override
  List<Object> get props => [
        id,
        name,
        slug,
        description,
      ];

  factory SubProfession.fromJson(Map<String, dynamic> json) =>
      _$SubProfessionFromJson(json);
  Map<String, dynamic> toJson() => _$SubProfessionToJson(this);

  String get subProfessionDescription {
    if (description.isEmpty) {
      return '';
    }
    return description;
  }

  String get subProfessionName {
    if (name.isEmpty) {
      return '';
    }
    return name;
  }

  String get subProfessionSlug {
    if (slug.isEmpty) {
      return '';
    }
    return slug;
  }
}
