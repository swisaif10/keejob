import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/authentication/blocs/blocs.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/injector.dart';
import '../screens/job_detail_screen.dart';
import 'package:keejob_mobile/jobs/models/job.dart';
import 'package:keejob_mobile/favorites/services/favorite_job.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/theme/theme.dart';

class JobListItem extends StatefulWidget {
  final Job job;
  final DateTime dateCandidature;

  JobListItem(this.job, this.dateCandidature);

  @override
  _JobListItemState createState() => _JobListItemState();
}

class _JobListItemState extends State<JobListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 3,
                child: (widget.job.format == 2) || (widget.job.format == 3)
                    ? Text(
                        widget.job.title!,
                        maxLines: 6,
                        style: jobFormat,
                      )
                    : Row(children: [
                        SizedBox(width: 13),
                        Expanded(
                            child: Text(
                          widget.job.title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: jobFormat1,
                        ))
                      ])),
            Container(
                width: 25,
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                  return state.when(
                      initial: () => Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                      loading: () => Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                      notAuthenticated: () => Opacity(opacity: 0.0),
                      failure: (_) => Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                      authenticated: (user) {
                        return IconButton(
                          icon: widget.job.isFavorite
                              ? Icon(
                                  Icons.bookmark,
                                  color: Colors.grey[800],
                                )
                              : Icon(Icons.bookmark_border, color: iconColor),
                          onPressed: () async {
                            bool? isFavorite;
                            try {
                              if (widget.job.isFavorite == false) {
                                isFavorite = true;
                                await Injector.resolve<
                                        FavoriteJobServiceInterface>()
                                    .addToFavorite(widget.job.id);
                                Injector.resolve<GlobalMessageService>()
                                    .show('Annonce ajoutée à vos favoris.');
                              } else if (widget.job.isFavorite == true) {
                                isFavorite = false;
                                await Injector.resolve<
                                        FavoriteJobServiceInterface>()
                                    .deleteFromFavorite(widget.job.id);
                                Injector.resolve<GlobalMessageService>()
                                    .show('Annonce enlevée de vos favoris.');
                              }
                              if (isFavorite != null) {
                                setState(() {
                                  widget.job.isFavorite = isFavorite!;
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        );
                      });
                }))
          ]),
          isThreeLine: true,
          subtitle: (widget.job.format == 1)
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  //SizedBox(height: 5),
                  Row(children: [
                    SizedBox(width: 18),
                    Expanded(
                        flex: 2,
                        child: Text(
                          widget.job.recruiter!.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: listSubTitleStyle,
                        )),
                  ]),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(width: 20),
                      SizedBox(height: 35),
                      Icon(
                        Icons.room,
                        color: iconColor,
                        size: 17,
                      ),
                      Text(widget.job.region ?? ''),
                      SizedBox(width: 5),
                      (widget.job.experienceLevel!.startsWith('Aucune'))
                          ? Container(
                              height: 0,
                              width: 0,
                            )
                          : Row(children: [
                              Icon(Icons.work_outline_sharp,
                                  color: iconColor, size: 17),
                              SizedBox(width: 3),
                              Text(widget.job.jobExperienceLevel)
                            ])
                    ],
                  ),
                  (widget.dateCandidature.isAfter(widget.job.publicationDate!))
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(width: 20),
                            Icon(
                              Icons.query_builder,
                              color: iconColor,
                              size: 17,
                            ),
                            Text(AppConfig.DISPLAY_DATE_FORMAT
                                .format(widget.job.publicationDate!)),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(width: 20),
                            Icon(
                              Icons.today,
                              color: iconColor,
                              size: 17,
                            ),
                            Text(AppConfig.DISPLAY_DATE_FORMAT
                                .format(widget.dateCandidature)),
                          ],
                        ),
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 5),
                  Text(
                    widget.job.recruiter!.name,
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
                      Text(widget.job.region ?? ''),
                      SizedBox(width: 5),
                      (widget.job.experienceLevel!.startsWith('Aucune'))
                          ? Container(
                              height: 0,
                              width: 0,
                            )
                          : Row(children: [
                              Icon(Icons.work_outline_sharp,
                                  color: iconColor, size: 17),
                              SizedBox(width: 3),
                              Text(widget.job.jobExperienceLevel)
                            ])
                    ],
                  ),
                  (widget.dateCandidature.isAfter(widget.job.publicationDate!))
                      ? Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.query_builder,
                              color: iconColor,
                              size: 17,
                            ),
                            Text(AppConfig.DISPLAY_DATE_FORMAT
                                .format(widget.job.publicationDate!)),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Icon(
                              Icons.today,
                              color: iconColor,
                              size: 17,
                            ),
                            Text(AppConfig.DISPLAY_DATE_FORMAT
                                .format(widget.dateCandidature)),
                          ],
                        ),
                ]),
          leading: (widget.job.format == 3 || widget.job.format == 2)
              ? Hero(
                  tag: '${widget.job.id}-logo',
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 54,
                      minHeight: 54,
                      maxWidth: 65,
                      maxHeight: 65,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border:
                              Border.all(width: 2, color: Colors.grey[400]!),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.network(widget.job.recruiter!.logoImage),
                        )),
                  ))
              : Hero(
                  tag: '${widget.job.id}-logo',
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 34,
                      minHeight: 34,
                      maxWidth: 50,
                      maxHeight: 50,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border:
                              Border.all(width: 2, color: Colors.grey[400]!),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.network(widget.job.recruiter!.logoImage),
                        )),
                  )),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobDetailScreen(job: widget.job)));
          },
        ),
      ],
    );
  }

  bool isExpired(Job job) {
    return job.jobStatus != 'O';
  }
}
