import 'package:flutter/material.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/trainings/models/training.dart';
import 'package:keejob_mobile/trainings/training_detail_screen.dart';

class TrainingListItem extends StatelessWidget {
  final Training training;

  TrainingListItem({required this.training});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(
          training.title,
          maxLines: 6,
          style: listTitleStyle,
        ),
        isThreeLine: true,
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Text(
                training.recruiter.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: listSubTitleStyle,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 35),
                  Icon(
                    Icons.room,
                    color: iconColor,
                    size: 17,
                  ),
                  Text(training.region!)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.query_builder,
                    color: iconColor,
                    size: 17,
                  ),
                  Text(AppConfig.DISPLAY_DATE_FORMAT
                      .format(training.publicationDate)),
                ],
              )
            ]),
        leading: Hero(
          tag: '${training.id}-training-logo',
          child: ConstrainedBox(
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
                child: Image.network(training.recruiter.logoImage),
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return TrainingDetailScreen(training: training);
              },
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return Align(
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
            ),
          );
        },
      ),
      /*
      Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
            margin: const EdgeInsets.only(left: 18, right: 10),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return TrainingDetailScreen(training: training);
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return Align(
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                  ),
                );
              },
              icon: Icon(Icons.play_arrow, size: 18, color: Colors.blue[900]),
              label: Text(
                'Voir formation',
                style: TextStyle(color: Colors.blue[900]),
              ),
            )),
        Container(
            margin: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[800])),
                onPressed: () {
                  Injector.resolve<CustomNavigator>()
                      .pushContactTrainingCenter(training: training);
                },
                child: Text('Contacter le centre')))
      ])*/
    ]);
  }
}
