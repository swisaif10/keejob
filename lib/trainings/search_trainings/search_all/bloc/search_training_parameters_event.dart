import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class SearchTrainingParametersEvent extends Equatable {
  const SearchTrainingParametersEvent();

  @override
  List<Object?> get props => [];
}

class ResetSearchParameters extends SearchTrainingParametersEvent {}

class SetKeyword extends SearchTrainingParametersEvent {
  final String? keyword;
  SetKeyword(
    this.keyword,
  );

  @override
  List<Object?> get props => [
        keyword,
      ];
}

class SetDomainName extends SearchTrainingParametersEvent {
  final int? domainName;
  SetDomainName(
    this.domainName,
  );

  @override
  List<Object?> get props => [
        domainName,
      ];
}

class SetLocality extends SearchTrainingParametersEvent {
  final int locality;
  SetLocality(
      this.locality,
      );

  @override
  List<Object> get props => [
    locality,
  ];
}

class RemoveLocality extends SearchTrainingParametersEvent {
  final int locality;
  RemoveLocality(
      this.locality,
      );

  @override
  List<Object> get props => [
    locality,
  ];
}