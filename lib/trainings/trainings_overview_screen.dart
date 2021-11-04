import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_bloc.dart';
import 'package:keejob_mobile/trainings/search_trainings/widgets/search_training.dart';
import 'package:keejob_mobile/trainings/training_grid.dart';

import '../size_config.dart';

class TrainingsOverviewScreen extends StatefulWidget {
  final Widget navigationBar;

  TrainingsOverviewScreen(this.navigationBar);

  @override
  _TrainingsOverviewScreenState createState() =>
      _TrainingsOverviewScreenState();
}

class _TrainingsOverviewScreenState extends State<TrainingsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => Injector.resolve<TrainingListBloc>(),
      child: Scaffold(
        key: _scaffoldKey,

        endDrawer:
          Container(width: SizeConfig.screenWidth - 30, child: SearchTraining()),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: AppBarLogo(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.grey[700], size: 25),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
        body: TrainingsGrid(),
        bottomNavigationBar: widget.navigationBar,
      ),
    );
  }
}
