import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/profession_bloc/search_profession_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/profession_bloc/search_profession_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/profession_bloc/search_profession_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;

class ProfessionFilterWidget extends StatefulWidget {
  @override
  _ProfessionFilterWidgetState createState() => _ProfessionFilterWidgetState();
}

class _ProfessionFilterWidgetState extends State<ProfessionFilterWidget> {
  StreamSubscription? searchParamsStreamSubscription;
  List<int>? selectedProfessions = [];

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    if (state is SearchParamsState.Initial) {
      setState(() {
        selectedProfessions = [];
      });
    }
    if (state is SearchParamsState.Saved) {
      setState(() {
        selectedProfessions = state.professions;
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
    return BlocProvider<SearchProfessionListBloc>(
        create: (_) => Injector.resolve<SearchProfessionListBloc>()
          ..add(GetSearchProfessionList()),
        child: BlocBuilder<SearchProfessionListBloc, SearchProfessionListState>(
            builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (search) {
            if (search.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            String title = 'Métiers';
            Color color = Colors.black;
            if (selectedProfessions != null &&
                selectedProfessions!.isNotEmpty) {
              title += ' -- ${selectedProfessions!.length}';
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
                        return CheckboxListTile(
                            value:
                                selectedProfessions!.contains(search[index].id),
                            title: Text(search[index].name),
                            onChanged: (bool? newValue) {
                              if (!newValue!) {
                                BlocProvider.of<SearchParametersBloc>(context)
                                    .add(RemoveProfession(search[index].id));
                              } else {
                                BlocProvider.of<SearchParametersBloc>(context)
                                    .add(SetProfession(search[index].id));
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
