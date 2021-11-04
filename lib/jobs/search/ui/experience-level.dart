import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;

class ExperienceLevelFilterWidget extends StatefulWidget {
  @override
  _ExperienceLevelFilterWidgetState createState() =>
      _ExperienceLevelFilterWidgetState();
}

class _ExperienceLevelFilterWidgetState
    extends State<ExperienceLevelFilterWidget> {
  StreamSubscription? searchParamsStreamSubscription;
  int? selectedExperienceLevel = 0;

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    if (state is SearchParamsState.Initial) {
      setState(() {
        selectedExperienceLevel = 0;
      });
    }
    if (state is SearchParamsState.Saved) {
      setState(() {
        selectedExperienceLevel = state.experienceLevel;
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

    return BlocProvider<SearchExperienceLevelBloc>(
        create: (_) => Injector.resolve<SearchExperienceLevelBloc>()
          ..add(GetExperienceLevelList()),
        child: BlocBuilder<SearchExperienceLevelBloc,
            SearchExperienceLevelListState>(builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (search) {
            if (search == null || search.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            return Card(
                child: ExpansionTile(
                    title: Text(
                      'Niveau d\'expérience',
                      style: TextStyle(
                          color: (selectedExperienceLevel != null &&
                                  selectedExperienceLevel! > 0)
                              ? Colors.blue
                              : Colors.black),
                    ),
                    children: [
                  Divider(height: 1.0),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: search.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RadioListTile(
                            value: int.parse(search.keys.toList()[index]),
                            groupValue: selectedExperienceLevel,
                            title: Text(search.values.toList()[index]),
                            toggleable: true,
                            onChanged: (int? newValue) {
                              BlocProvider.of<SearchParametersBloc>(context)
                                  .add(SetExperienceLevel(newValue ?? 0));
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
