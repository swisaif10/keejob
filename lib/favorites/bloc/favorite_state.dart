import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keejob_mobile/favorites/models/favorite.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteListState with _$FavoriteListState {
  const factory FavoriteListState.initial() = FavoriteListInitial;
  const factory FavoriteListState.loading() = FavoriteListLoading;
  const factory FavoriteListState.success(List<FavoriteJob>? favoriteJobs) =
      FavoriteListSuccess;
}
