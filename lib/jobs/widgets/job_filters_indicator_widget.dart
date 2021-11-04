import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;

class JobFilterIndicatorButton extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  JobFilterIndicatorButton(this.scaffoldKey);

  @override
  _JobFilterIndicatorButtonState createState() =>
      _JobFilterIndicatorButtonState();
}

class _JobFilterIndicatorButtonState extends State<JobFilterIndicatorButton> {
  int searchFiltersCount = 0;
  StreamSubscription? searchParamsStreamSubscription;

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    int filtersCount = 0;
    if (state is SearchParamsState.Saved) {
      if (state.localities.isNotEmpty) {
        filtersCount++;
      }
      if (state.education != null && state.education != 0) {
        filtersCount++;
      }
      if (state.experienceLevel != null && state.experienceLevel != 0) {
        filtersCount++;
      }
      if (state.keyword != null && state.keyword != '') {
        filtersCount++;
      }
      if (state.professions.isNotEmpty) {
        filtersCount++;
      }
      if (state.jobTypes.isNotEmpty) {
        filtersCount++;
      }
    }
    setState(() {
      searchFiltersCount = filtersCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    searchParamsStreamSubscription?.cancel();
    SearchParametersBloc searchParametersBloc =
        BlocProvider.of<SearchParametersBloc>(context);
    searchParamsStreamSubscription =
        searchParametersBloc.stream.listen((state) {
      checkSearchState(state);
    });
    // Check current state of search params after widget building
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      checkSearchState(searchParametersBloc.state);
    });
    return searchFiltersCount == 0
        ? Container(width: 0, height: 0)
        : FloatingActionButton.extended(
            onPressed: () {
              widget.scaffoldKey.currentState!.openEndDrawer();
            },
            icon: Icon(Icons.filter_list),
            label: Text(
              'Filtres ($searchFiltersCount)',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue[800],
          );
  }

  @override
  void dispose() {
    searchParamsStreamSubscription?.cancel();
    super.dispose();
  }
}
