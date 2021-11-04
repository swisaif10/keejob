import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;

class LocalityFilterWidget extends StatefulWidget {

  final String? comeFrom ;
  LocalityFilterWidget(this.comeFrom);

  @override
  _LocalityFilterWidgetState createState() => _LocalityFilterWidgetState();
}

class _LocalityFilterWidgetState extends State<LocalityFilterWidget> {
  StreamSubscription? searchParamsStreamSubscription;
  List<int>? selectedLocalities = [];
  late String title ;

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    if (state is SearchParamsState.Initial) {
      setState(() {
        selectedLocalities = [];
      });
    }
    if (state is SearchParamsState.Saved) {
      setState(() {
        selectedLocalities = state.localities;
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
    return BlocProvider<SearchLocalityBloc>(
      lazy: false,
      create: (_) =>
          Injector.resolve<SearchLocalityBloc>()..add(GetLocalityList()),
      child: BlocBuilder<SearchLocalityBloc, SearchLocalityListState>(
          builder: (context, state) {
        return state.when(initial: () {
          return Center();
        }, success: (search) {
          if (search == null || search.isEmpty) {
            return Center(
              child: Text('no search'),
            );
          }

          (widget.comeFrom == 'job') ?
           title = 'Lieux de travail' :
          title = 'Lieux de formation' ;

          Color color = Colors.black;
          if (selectedLocalities != null && selectedLocalities!.isNotEmpty) {
            title += ' -- ${selectedLocalities!.length}';
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
                      bool selected =
                          selectedLocalities!.contains(search[index]['id']);
                      return CheckboxListTile(
                        value: selected,
                        title: Text(search[index]['name']),
                        onChanged: (bool? newValue) {
                          if (!newValue!) {
                            Injector.resolve<SearchParametersBloc>()
                                .add(RemoveLocality(search[index]['id']));
                          } else {
                            Injector.resolve<SearchParametersBloc>()
                                .add(SetLocality(search[index]['id']));
                          }
                        },
                      );
                    })
              ]));
        });
      }),
    );
  }

  @override
  void dispose() {
    searchParamsStreamSubscription?.cancel();
    super.dispose();
  }
}
