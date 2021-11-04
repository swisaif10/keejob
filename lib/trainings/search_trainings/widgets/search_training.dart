import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/jobs/search/ui/locality-filter.dart';
import '../search_all/bloc/search_training_parameters_bloc.dart';
import '../search_all/bloc/search_training_parameters_event.dart';
import 'training-domain-filter.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_bloc.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_event.dart';

class SearchTraining extends StatefulWidget {
  static int? keyDomain;
  static String keyMotCle = '';

  @override
  _SearchTrainingState createState() => _SearchTrainingState();
}

class _SearchTrainingState extends State<SearchTraining> {
  late final myController = TextEditingController();
  String comeFrom = 'training' ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
            appBar: AppBar(
              title: Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      print(myController.text);
                      myController.text = '';
                      //BlocProvider.of<SearchParametersBloc>(context).add(SetKeyword(''));
                      BlocProvider.of<SearchTrainingParametersBloc>(context)
                          .add(ResetSearchParameters());
                      BlocProvider.of<TrainingListBloc>(context)
                          .add(RefreshTrainingsList());
                    },
                    child: Text('Reset'),
                  )),
              backgroundColor: Colors.white,
              leading: Row(children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: iconColor),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ]),
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin:
                            const EdgeInsets.only(top: 50, right: 10, left: 10),
                        child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                              labelText: 'Mots clés',
                              border: OutlineInputBorder(),
                            ),
                            textInputAction: TextInputAction.done,
                            onChanged: (text) {
                              BlocProvider.of<SearchTrainingParametersBloc>(
                                      context)
                                  .add(SetKeyword(myController.text));
                            })),
                    SizedBox(
                      height: 20,
                    ),
                    TrainingDomainFilterWidget(),
                    LocalityFilterWidget(comeFrom),
                  ]),
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                BlocProvider.of<TrainingListBloc>(context)
                    .add(RefreshTrainingsList());
                Navigator.pop(context);
              },
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6 / 10,
                  width: MediaQuery.of(context).size.width * 2 / 5,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[800],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Rechercher',
                            style: TextStyle(color: Colors.white)),
                      ])),
            )));
  }
}
