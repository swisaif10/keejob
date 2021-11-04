import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/jobs/models/date_converter.dart';
import 'package:keejob_mobile/jobs/models/job.dart';

part 'favorite.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@CustomDateTimeConverter()
class FavoriteJob extends Equatable {
  final int id;
  @JsonKey(name: 'job_details')
  final Job job;

  FavoriteJob({
    required this.id,
    required this.job,
  });

  @override
  List<Object> get props => [
        id,
        job,
      ];

  factory FavoriteJob.fromJson(Map<String, dynamic> json) =>
      _$FavoriteJobFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteJobToJson(this);
}
