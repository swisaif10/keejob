import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/injector.dart';
import '../search_all/bloc/search_training_parameters_bloc.dart';
import '../search_all/bloc/search_training_parameters_state.dart'
    as SearchParamsState;
import '../search_all/bloc/search_training_parameters_event.dart';
import '../search_domain_name/bloc/search_training_bloc.dart';
import '../search_domain_name/bloc/search_training_event.dart';
import '../search_domain_name/bloc/search_training_state.dart';

class TrainingDomainFilterWidget extends StatefulWidget {
  @override
  _TrainingDomainFilterWidgetState createState() =>
      _TrainingDomainFilterWidgetState();
}

class _TrainingDomainFilterWidgetState
    extends State<TrainingDomainFilterWidget> {
  StreamSubscription? searchParamsStreamSubscription;
  int? selectedTrainingDomain = 0;

  void checkSearchState(SearchParamsState.SearchTrainingParametersState state) {
    if (state is SearchParamsState.Initial) {
      setState(() {
        selectedTrainingDomain = 0;
      });
    }
    if (state is SearchParamsState.Saved) {
      if (state.domainName != 0) {
        setState(() {
          selectedTrainingDomain = state.domainName;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    searchParamsStreamSubscription?.cancel();
    SearchTrainingParametersBloc searchParametersBloc =
        BlocProvider.of<SearchTrainingParametersBloc>(context);
    searchParamsStreamSubscription =
        searchParametersBloc.stream.listen((state) {
      checkSearchState(state);
    });
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      checkSearchState(searchParametersBloc.state);
    });

    return BlocProvider<SearchTrainingListBloc>(
        create: (_) => Injector.resolve<SearchTrainingListBloc>()
          ..add(GetSearchTrainingList()),
        child: BlocBuilder<SearchTrainingListBloc, SearchTrainingListState>(
            builder: (context, state) {
          return state.when(initial: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }, success: (search) {
            if (search.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            return Card(
                child: ExpansionTile(
                    //initiallyExpanded :  true ,
                    title: Text('Domaine '),
                    children: [
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
                        : ListTile(
                            selected:
                                selectedTrainingDomain == search[index]['id'],
                            title: Text(search[index]['name']),
                            onTap: () {
                              setState(() {
                                BlocProvider.of<SearchTrainingParametersBloc>(
                                        context)
                                    .add(SetDomainName(search[index]['id']));
                              });
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
