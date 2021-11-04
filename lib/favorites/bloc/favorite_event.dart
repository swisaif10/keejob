import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteList extends FavoriteListEvent {}
