import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SearchParametersEvent extends Equatable {
  const SearchParametersEvent();

  @override
  List<Object> get props => [];
}

class ResetSearchParameters extends SearchParametersEvent {}


class SetKeyword extends SearchParametersEvent {
  final String? keyword;
  SetKeyword(
      this.keyword,
      );

  @override
  List<Object> get props => [
    keyword!,
  ];
}

class SetLocality extends SearchParametersEvent {
  final int locality;
  SetLocality(
    this.locality,
  );

  @override
  List<Object> get props => [
        locality,
      ];
}

class RemoveLocality extends SearchParametersEvent {
  final int locality;
  RemoveLocality(
    this.locality,
  );

  @override
  List<Object> get props => [
        locality,
      ];
}

class SetProfession extends SearchParametersEvent {
  final int profession;
  SetProfession(
    this.profession,
  );

  @override
  List<Object> get props => [
        profession,
      ];
}

class RemoveProfession extends SearchParametersEvent {
  final int profession;
  RemoveProfession(
    this.profession,
  );

  @override
  List<Object> get props => [
        profession,
      ];
}

class SetEducation extends SearchParametersEvent {
  final int education;
  SetEducation(
    this.education,
  );

  @override
  List<Object> get props => [
        education,
      ];
}


class RemoveEducation extends SearchParametersEvent {
  final int education;
  RemoveEducation(
      this.education,
      );

  @override
  List<Object> get props => [
    education,
  ];
}


class SetExperienceLevel extends SearchParametersEvent {
  final int experienceLevel;
  SetExperienceLevel(
    this.experienceLevel,
  );

  @override
  List<Object> get props => [
        experienceLevel,
      ];
}

class RemoveExperienceLevel extends SearchParametersEvent {
  final int experienceLevel;
  RemoveExperienceLevel(
      this.experienceLevel,
      );

  @override
  List<Object> get props => [
    experienceLevel,
  ];
}


class SetJobType extends SearchParametersEvent {
  final int jobType;
  SetJobType(
    this.jobType,
  );

  @override
  List<Object> get props => [
        jobType,
      ];
}

class RemoveJobType extends SearchParametersEvent {
  final int jobType;
  RemoveJobType(
    this.jobType,
  );

  @override
  List<Object> get props => [
        jobType,
      ];
}

