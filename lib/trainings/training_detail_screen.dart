import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/trainings/bloc/training_event.dart';
import 'package:share/share.dart';
import './bloc/training_bloc.dart';
import 'package:keejob_mobile/trainings/models/training.dart';

class TrainingDetailScreen extends StatelessWidget {
  static const routeName = '/training-detail';
  final int? trainingId;
  final Training? training;
  final count = 0;

  TrainingDetailScreen({this.trainingId, this.training});

  @override
  Widget build(BuildContext context) {
    if (trainingId != null) {
      return BlocProvider(
        create: (_) =>
            Injector.resolve<TrainingBloc>()..add(GetTraining(trainingId!)),
        child:
            BlocBuilder<TrainingBloc, TrainingState>(builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state is TrainingLoaded ? state.training!.title : ''),
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: iconColor),
                  onPressed: () => Navigator.of(context).pop()),
            ),
            body: state is TrainingLoading ||
                    state is TrainingInitial ||
                    state is! TrainingLoaded
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildBody(context, state.training!),
            floatingActionButton: state is TrainingLoading ||
                    state is TrainingInitial ||
                    state is! TrainingLoaded
                ? null
                : _buildFloatingActionButton(context, state.training!),
          );
        }),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            training!.title,
            style: appBarTitleStyle,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: buildBody(context, training!),
        floatingActionButton: _buildFloatingActionButton(context, training!),
      );
    }
  }

  _onShare(BuildContext context, Training training) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    Share.share(
      training.url,
      subject: training.title,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  Widget _buildFloatingActionButton(BuildContext context, Training training) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(top: 10),
          child: FloatingActionButton.extended(
            heroTag: 'contact_btn',
            onPressed: () {
              Injector.resolve<CustomNavigator>()
                  .pushContactTrainingCenter(training: training);
            },
            label: Text(
              'Contacter le centre',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue[800],
          ))
    ]);
  }

  Widget buildBody(BuildContext context, Training loadedTraining) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              /* Container(
            child: Row(children: <Widget>[
              ButtonTheme(
                  minWidth: 30,
                  height: 20,
                  child: OutlineButton(
                    onPressed: () {
                      print('Received click');
                    },
                    child: Text(
                      'Précédent',
                      style: bodyStyle,
                    ),
                  )),
              ButtonTheme(
                  minWidth: 10.0,
                  height: 20.0,
                  child: OutlineButton(
                    onPressed: () {
                      print('Received click');
                    },
                    child: Text('Suivant', style: bodyStyle),
                  ))
            ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
            margin: EdgeInsets.all(5)),*/
              SizedBox(
                  child: ListTile(
                //// TITLE
                title: Text(
                  loadedTraining.title,
                  style: titleStyle,
                ),
                isThreeLine: true,
                subtitle: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.room, color: iconColor, size: 16,),
                        Container(
                            padding: EdgeInsets.all(8),
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 170),
                            child: Text(loadedTraining.region ?? '')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.query_builder, color: iconColor , size: 16,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            child: Text('Durée: ' + loadedTraining.duration!)),
                      ],
                    ),
                    if (loadedTraining.priceWithUnit != '')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.payment, color: iconColor , size: 16),
                          Container(
                            padding: EdgeInsets.all(8),
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 170),
                            child: Text(loadedTraining.priceWithUnit),
                          ),
                        ],
                      )
                  ],
                ),

                /// LOGOOO
                leading: trainingId != null
                    ? _buildLogo(loadedTraining)
                    : Hero(
                        tag: '${loadedTraining.id}-training-logo',
                        child: _buildLogo(loadedTraining),
                      ),
                trailing: IconButton(
                  icon: const Icon(Icons.share),
                  color: iconColor,
                  onPressed: () {
                    _onShare(context, loadedTraining);
                  },
                ),
              )),
              Divider(height: 0.5),
              Column(
                children: <Widget>[
                  Column(
                    children: [
                      Card(
                          child: Column(children: [
                        //// COMPANY NAME CONTAINER
                        Column(
                          children: <Widget>[
                            loadedTraining.recruiter.recruiterDescription != ''
                                ? ExpansionTile(
                                    title: Row(
                                      children: [
                                        Row(children: [
                                          Text('Entreprise: ',
                                              style: subtitleBoldStyle)
                                        ]),
                                        Row(
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                  minWidth: 100, maxWidth: 170),
                                              child: Text(
                                                loadedTraining.recruiter.name,
                                                style: bodyStyle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        title: Container(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10, right: 10),
                                          child: Html(
                                              data: loadedTraining.recruiter
                                                  .recruiterDescription),
                                        ),
                                      )
                                    ],
                                  )
                                : Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text('Entreprise: ',
                                            style: subtitleBoldStyle),
                                        Text(loadedTraining.recruiter.name,
                                            style: bodyStyle),
                                      ],
                                    ),
                                  ),
                            Divider()
                          ],
                        ),

                        /// DESCRIPTION CONTAINER
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // color: Colors.grey[200],
                                border: Border.all(
                                  color: borderColor!,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //padding: EdgeInsets.all(1),
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      child: Text(
                                        'Description:',
                                        style: subtitleBoldStyle,
                                      ),
                                      margin: const EdgeInsets.only(right: 230),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Html(
                                          data: loadedTraining.description),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ]))
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLogo(Training loadedTraining) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
        maxWidth: 64,
        maxHeight: 64,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 2, color: Colors.grey[400]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.network(loadedTraining.recruiter.logoImage),
        ),
      ),
    );
  }
}
