import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:keejob_mobile/authentication/blocs/blocs.dart';
import 'package:keejob_mobile/authentication/pages/login_page.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/favorites/services/favorite_job.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/widgets/home_widget.dart';
import 'package:share/share.dart';
import '../bloc/job_bloc.dart';
import '../models/job.dart';

class JobDetail extends StatefulWidget {
  static const routeName = '/job';
  late int? jobId = 0;

  JobDetail({this.jobId});

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  late final Widget navigationBar;
  late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<JobBloc>()..add(GetJob(widget.jobId!)),
      child: BlocBuilder<JobBloc, JobState>(builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
              title: Text(
                state is JobLoaded ? state.job.title! : '',
                style: appBarTitleStyle,
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: iconColor),
                  onPressed: () =>
                      Injector.resolve<CustomNavigator>().pushReplacementNamed(
                        Home.routeName,
                        type: RouteType.fade,
                      ))),
          body:
              state is JobLoading || state is JobInitial || state is! JobLoaded
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : buildBody(context, state.job),
          floatingActionButton:
              state is JobLoading || state is JobInitial || state is! JobLoaded
                  ? null
                  : _buildFloatingActionButton(context, state.job),
        );
      }),
    );
  }

  bool isExpired(Job job) {
    return job.jobStatus != 'O';
  }

  _onShare(BuildContext context, Job job) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(
      job.url!,
      subject: job.title,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  Widget _buildFloatingActionButton(BuildContext context, Job job) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return GestureDetector(
                onTap: () async {
                  if (state is AuthenticationNotAuthenticated) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                                job: job, nextRoute: JobDetail.routeName)));
                  } else if (state is AuthenticationAuthenticated) {
                    if (job.alreadyApplied == false && !isExpired(job))
                      Injector.resolve<CustomNavigator>()
                          .pushJobApplication(job: job);
                  }
                },
                child: (job.alreadyApplied == true)
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.6 / 10,
                        width: MediaQuery.of(context).size.width * 2.8 / 5,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue,
                                Colors.blueGrey,
                              ]),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            if (isExpired(job))
                              Text('Annonce expirée',
                                  style: TextStyle(color: Colors.white))
                            else if (job.alreadyApplied == true)
                              Text('Vous avez déjà postulé',
                                  style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    : Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(top: 10),
                        child: FloatingActionButton.extended(
                          heroTag: 'apply_to_job_btn',
                          onPressed: () => {
                            if (state is AuthenticationNotAuthenticated)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage(
                                            job: job,
                                            nextRoute: JobDetail.routeName)))
                              }
                            else if (state is AuthenticationAuthenticated)
                              {
                                if (job.alreadyApplied == false &&
                                    !isExpired(job))
                                  Injector.resolve<CustomNavigator>()
                                      .pushJobApplication(job: job)
                                else
                                  null
                              }
                          },
                          label: Text(
                            isExpired(job) ? 'Annonce expirée' : 'Postuler',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: job.alreadyApplied == false
                              ? Colors.blue[800]
                              : Colors.grey[600],
                        )));
          },
        ),
      )
    ]);
  }

  Widget buildBody(BuildContext context, Job loadedJob) {
    return Container(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
          Container(
              child: Row(children: <Widget>[
            Expanded(
                flex: 8, // 60% of space => (6/(6 + 4))
                child:
                    // Container(
                    //     child: Row(children: <Widget>[_
                    //       ButtonTheme(
                    //           minWidth: 30,
                    //           height: 20,
                    //           child: OutlinedButton(
                    //             onPressed: () {},
                    //             child: Text(
                    //               'Précédent',
                    //               style: bodyStyle,
                    //             ),
                    //           )),
                    //       ButtonTheme(
                    //           minWidth: 10.0,
                    //           height: 20.0,
                    //           child: OutlinedButton(
                    //             onPressed: () {},
                    //             child: Text('Suivant', style: bodyStyle),
                    //           ))
                    //     ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    //     margin: EdgeInsets.all(5)),
                    ListTile(
                  //// TITLE
                  title: Text(
                    loadedJob.jobTitle,
                    style: titleStyle,
                  ),
                  isThreeLine: true,
                  subtitle: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.room,
                          color: iconColor,
                          size: 16,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 170),
                            child: Text(loadedJob.regionText)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.tag,
                          color: iconColor,
                          size: 16,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 170),
                            child:
                                Text('Référence ' + loadedJob.id.toString())),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.query_builder,
                          color: iconColor,
                          size: 16,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            constraints:
                                BoxConstraints(minWidth: 100, maxWidth: 170),
                            child: Text('Publiée le ' +
                                AppConfig.DISPLAY_DATE_FORMAT
                                    .format(loadedJob.jobPublicationDate!))),
                      ],
                    ),
                    (loadedJob.jobType.isNotEmpty)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                SizedBox(height: 35),
                                Icon(
                                  Icons.app_registration,
                                  color: iconColor,
                                  size: 16,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  constraints: BoxConstraints(
                                      minWidth: 100, maxWidth: 170),
                                  child: Text(loadedJob.jobType),
                                ),
                              ])
                        : Container(height: 0, width: 0)
                  ]),

                  // LOGOOO
                  // Use Hero only for loaded job directly without ID and fresh
                  // data from server used for urls from web or Google search
                  leading: widget.jobId != null
                      ? _buildLogo(loadedJob)
                      : Hero(
                          tag: '${loadedJob.id}-logo',
                          child: _buildLogo(loadedJob),
                        ),
                )),
            Expanded(
                flex: 2, // 40% of space
                child: FittedBox(
                    fit: BoxFit.none,
                    child: Column(children: <Widget>[
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) {
                        return state.when(
                            initial: () => Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2)),
                            loading: () => Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2)),
                            notAuthenticated: () => Opacity(opacity: 0.0),
                            failure: (_) => Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2)),
                            authenticated: (user) {
                              return IconButton(
                                icon: loadedJob.isFavorite
                                    ? Icon(
                                        Icons.bookmark,
                                      )
                                    : Icon(Icons.bookmark_border,
                                        color: iconColor),
                                onPressed: () {
                                  try {
                                    setState(() {
                                      if (loadedJob.isFavorite == false) {
                                        loadedJob.isFavorite = true;
                                        Injector.resolve<
                                                FavoriteJobServiceInterface>()
                                            .addToFavorite(loadedJob.id);
                                        Injector.resolve<GlobalMessageService>()
                                            .show(
                                                'Annonce ajoutée à vos favoris.');
                                      } else if (loadedJob.isFavorite == true) {
                                        loadedJob.isFavorite = false;
                                        Injector.resolve<
                                                FavoriteJobServiceInterface>()
                                            .deleteFromFavorite(loadedJob.id);
                                        Injector.resolve<GlobalMessageService>()
                                            .show(
                                                'Annonce enlevée de vos favoris.');
                                      }
                                    });
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              );
                            });
                      }),
                      IconButton(
                        icon: const Icon(Icons.share),
                        color: iconColor,
                        onPressed: () {
                          _onShare(context, loadedJob);
                        },
                      ),
                    ])))
          ])),
          Divider(height: 0.5),
          Column(
            children: <Widget>[
              Card(
                  child: Column(children: [
                //// COMPANY NAME CONTAINER
                Column(children: <Widget>[
                  loadedJob.recruiter!.recruiterDescription != ''
                      ? ExpansionTile(
                          title: Row(children: [
                            Text('Entreprise: ', style: subtitleBoldStyle),
                            Flexible(
                                child: Text(
                              loadedJob.recruiter!.name,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: bodyStyle,
                            ))
                          ]),
                          children: <Widget>[
                            ListTile(
                                subtitle: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                                right: 10,
                              ),
                              child: Html(
                                data: loadedJob.recruiter!.recruiterDescription,
                              ),
                            ))
                          ],
                        )
                      : Column(children: [
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Row(children: [
                                Text('Entreprise: ', style: subtitleBoldStyle),
                                SizedBox(width: 10),
                                Text(loadedJob.recruiter!.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: bodyStyle),
                              ]))
                        ]),
                  Divider()
                ]),

                /// EDUCATION LEVEL CONTAINER
                Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Text('Niveau d\'étude: ', style: subtitleBoldStyle),
                        SizedBox(width: 10),
                        Text(loadedJob.jobEducationLevel, style: bodyStyle),
                      ])),
                  Divider()
                ]),
                /////  EXPERIENCE LEVEL
                Column(children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Row(children: [
                          Text('Niveau d\'expérience: ',
                              style: subtitleBoldStyle),
                          SizedBox(width: 10),
                          Text(loadedJob.jobExperienceLevel, style: bodyStyle),
                        ]),
                      ])),
                  Divider(height: 0.5),
                ]),

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
                        child: Column(children: [
                          SizedBox(height: 10),
                          Align(
                              alignment: Alignment(-0.95, 0.0),
                              child: Container(
                                child: Text('Description:',
                                    style: subtitleBoldStyle),
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Html(data: loadedJob.jobDescription),
                          ),
                        ]))
                  ],
                ),
              ]))
            ],
          ),
        ]));
  }

  ConstrainedBox _buildLogo(Job loadedJob) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
        maxWidth: 80,
        maxHeight: 80,
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 2, color: Colors.grey[400]!),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.network(loadedJob.recruiter!.logoImage),
          )),
    );
  }
}
