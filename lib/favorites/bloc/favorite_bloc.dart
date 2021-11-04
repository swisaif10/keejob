import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/favorites/bloc/favorite_event.dart';
import 'package:keejob_mobile/favorites/bloc/favorite_state.dart';
import '../services/favorite_job.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final FavoriteJobServiceInterface _favoriteService;

  FavoriteListBloc(this._favoriteService) : super(FavoriteListState.initial());

  @override
  Stream<FavoriteListState> mapEventToState(
    FavoriteListEvent event,
  ) async* {
    yield FavoriteListState.loading();
    final favorites = await _favoriteService.getListFavorite();
    yield FavoriteListState.success(favorites);
  }
}
