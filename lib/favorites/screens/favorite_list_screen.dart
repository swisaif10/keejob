import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/favorites/bloc/favorite_bloc.dart';
import 'package:keejob_mobile/favorites/bloc/favorite_state.dart';
import 'package:keejob_mobile/favorites/bloc/favorite_event.dart';
import 'package:keejob_mobile/favorites/models/favorite.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/widgets/job_list_item.dart';
import 'package:keejob_mobile/theme/theme.dart';

class FavoriteListScreen extends StatelessWidget {
  static const routeName = '/favorite-jobs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes offres favorites',
          style: appBarTitleStyle,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: iconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocProvider(
        create: (_) =>
            Injector.resolve<FavoriteListBloc>()..add(GetFavoriteList()),
        child: BlocBuilder<FavoriteListBloc, FavoriteListState>(
          builder: (context, state) {
            return state.when(
                initial: () => Center(child: CircularProgressIndicator()),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (applications) => _buildList(context, applications));
          },
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<FavoriteJob>? favoriteJobs) {
    if (favoriteJobs == null) {
      return Center(
        child: Text('Aucune annonce trouvée.',
            style: TextStyle(fontWeight: FontWeight.bold)),
      );
    }
    return ListView.separated(
      itemCount: favoriteJobs.length,
      separatorBuilder: (context, index) {
        return Divider(
          thickness: 1,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return JobListItem(favoriteJobs[index].job ,DateTime.now());
      },
    );
  }
}
