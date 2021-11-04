import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_bloc.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_event.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_state.dart';
import 'package:keejob_mobile/trainings/widgets/training_list_item.dart';

import 'bloc/training_list_bloc.dart';

class TrainingsGrid extends StatefulWidget {
  @override
  _TrainingsGridState createState() => _TrainingsGridState();
}

class _TrainingsGridState extends State<TrainingsGrid> {
  late final ScrollController _controller = ScrollController();
  final _scrollThreshold = 200.0;
  var message = ' ';

  //double offsetA = 0.0;
  late TrainingListBloc _trainingListBloc;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    _trainingListBloc = BlocProvider.of<TrainingListBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _trainingListBloc..add(GetTrainingList()),
        child: BlocBuilder<TrainingListBloc, TrainingListState>(
            builder: (context, state) {
          return state.when(initial: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }, success: (trainings, nextPageNumber) {
            if (trainings == null || trainings.isEmpty) {
              return Center(
                child: Text('no trainings'),
              );
            }
            return ListView.builder(
                key: PageStorageKey<String>('controllerA'),
                controller: _controller,
                itemCount: nextPageNumber == 0
                    ? trainings.length
                    : trainings.length + 1,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return index >= trainings.length
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
                      : Column(children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(5),
                              child:
                                  TrainingListItem(training: trainings[index])),
                          Divider(height: 2, color: Colors.grey[400])
                        ]);
                });
          });
        }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _trainingListBloc.add(GetTrainingList());
    }
  }
}
