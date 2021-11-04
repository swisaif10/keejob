import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;

class EducationLevelFilterWidget extends StatefulWidget {
  @override
  _EducationLevelFilterWidgetState createState() =>
      _EducationLevelFilterWidgetState();
}

class _EducationLevelFilterWidgetState
    extends State<EducationLevelFilterWidget> {
  StreamSubscription? searchParamsStreamSubscription;
  int? selectedEducation = 0;

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    if (state is SearchParamsState.Initial) {
      setState(() {
        selectedEducation = 0;
      });
    }
    if (state is SearchParamsState.Saved) {
      setState(() {
        selectedEducation = state.education;
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

    return BlocProvider<SearchEducationLevelBloc>(
        create: (_) => Injector.resolve<SearchEducationLevelBloc>()
          ..add(GetEducationLevelList()),
        child: BlocBuilder<SearchEducationLevelBloc,
            SearchEducationLevelListState>(builder: (context, state) {
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
                      'Niveau d\'études',
                      style: TextStyle(
                          color: (selectedEducation != null &&
                                  selectedEducation! > 0)
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
                        return index >= search.length
                            ? Container(
                                alignment: Alignment.center,
                                child: Center(
                                  child: SizedBox(
                                    width: 33,
                                    height: 33,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                    ),
                                  ),
                                ),
                              )
                            : RadioListTile(
                                value: int.parse(search.keys.toList()[index]),
                                groupValue: selectedEducation,
                                toggleable: true,
                                title: Text(search.values.toList()[index]),
                                onChanged: (int? newValue) {
                                  BlocProvider.of<SearchParametersBloc>(context)
                                      .add(SetEducation(newValue ?? 0));
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
