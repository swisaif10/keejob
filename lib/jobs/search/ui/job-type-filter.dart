import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/job_types_bloc/job_types_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/job_types_bloc/job_types_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/job_types_bloc/job_types_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;

class JobTypeFilterWidget extends StatefulWidget {
  @override
  _JobTypeFilterWidgetState createState() => _JobTypeFilterWidgetState();
}

class _JobTypeFilterWidgetState extends State<JobTypeFilterWidget> {
  StreamSubscription? searchParamsStreamSubscription;
  List<int> selectedJobTypes = [];

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    if (state is SearchParamsState.Initial) {
      setState(() {
        selectedJobTypes = [];
      });
    }
    if (state is SearchParamsState.Saved) {
      setState(() {
        selectedJobTypes = state.jobTypes;
      });
    }
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

    return BlocProvider<SearchJobTypesBloc>(
        lazy: false,
        create: (_) =>
            Injector.resolve<SearchJobTypesBloc>()..add(GetJobTypesList()),
        child: BlocBuilder<SearchJobTypesBloc, SearchJobTypesListState>(
            builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (search) {
            if (search == null || search.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            String title = 'Type de poste';
            Color color = Colors.black;
            if (selectedJobTypes.isNotEmpty) {
              title += ' -- ${selectedJobTypes.length}';
              color = Colors.blue;
            }
            return Card(
                child: ExpansionTile(
                    title: Text(title, style: TextStyle(color: color)),
                    children: [
                  Divider(height: 1.0),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: search.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentId =
                            int.parse(search.keys.toList()[index]);
                        return CheckboxListTile(
                            value: selectedJobTypes.contains(currentId),
                            title: Text(search.values.toList()[index]),
                            onChanged: (bool? newValue) {
                              if (!newValue!) {
                                BlocProvider.of<SearchParametersBloc>(context)
                                    .add(RemoveJobType(currentId));
                              } else {
                                Injector.resolve<SearchParametersBloc>()
                                    .add(SetJobType(currentId));
                              }
                            });
                      })
                ]));
          });
        }));
  }

  @override
  void dispose() {
    searchParamsStreamSubscription?.cancel();
    super.dispose();
  }
}
