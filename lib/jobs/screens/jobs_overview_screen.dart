import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/bloc/jobs_list_bloc.dart';
import '../widgets/job_filters_indicator_widget.dart';
import './jobs_grid.dart';
import 'package:keejob_mobile/jobs/search/ui/search_job.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';
import 'package:keejob_mobile/size_config.dart';

class JobsOverviewScreen extends StatefulWidget {
  final Widget navigationBar;

  JobsOverviewScreen(this.navigationBar);

  @override
  _JobsOverviewScreenState createState() => _JobsOverviewScreenState();
}

class _JobsOverviewScreenState extends State<JobsOverviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late bool toggle = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => Injector.resolve<JobsListBloc>(),
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer:
            Container(width: SizeConfig.screenWidth - 30, child: SearchJob()),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: AppBarLogo(),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.grey[700], size: 25),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
        body: JobsGrid(),
        bottomNavigationBar: widget.navigationBar,
        floatingActionButton: JobFilterIndicatorButton(_scaffoldKey),
      ),
    );
  }
}
