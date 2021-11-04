import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/jobs/models/date_converter.dart';
import 'package:keejob_mobile/jobs/models/job.dart';

part 'application.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@CustomDateTimeConverter()
class Application extends Equatable {
  final int id;
  @JsonKey(name: 'job_details')
  final Job job;
  final DateTime applicationDate;

  Application({
    required this.id,
    required this.job,
    required this.applicationDate,
  });

  @override
  List<Object> get props => [
        id,
        job,
        applicationDate,
      ];

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
