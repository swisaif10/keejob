import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchProfessionListEvent extends Equatable {
  const SearchProfessionListEvent();

  @override
  List<Object> get props => [];
}

class GetSearchProfessionList extends SearchProfessionListEvent {}



