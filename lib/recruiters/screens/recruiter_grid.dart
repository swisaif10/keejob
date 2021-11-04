import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiters_list_bloc.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiters_list_event.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiters_list_state.dart';
import 'package:keejob_mobile/theme/theme.dart';

class RecruiterGrid extends StatefulWidget {
  @override
  _RecruiterGridState createState() => _RecruiterGridState();
}

class _RecruiterGridState extends State<RecruiterGrid> {
  var message = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<RecruitersListBloc>(
            create: (_) => Injector.resolve<RecruitersListBloc>()
              ..add(GetRecruitersList()),
            child: BlocBuilder<RecruitersListBloc, RecruitersListState>(
                builder: (context, state) {
              return state.when(
                initial: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (search, next) {
                  if (search.isEmpty) {
                    return Center(
                      child: Text('no search'),
                    );
                  }
                  return ListView.builder(
                      itemCount: search.length,
                      shrinkWrap: true,
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
                            : Card(
                                margin: EdgeInsets.only(
                                    top: 10, left: 20, right: 20),
                                elevation: 20,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin:
                                            EdgeInsets.only(top: 10, left: 20),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minWidth: 44,
                                            minHeight: 44,
                                            maxWidth: 64,
                                            maxHeight: 64,
                                          ),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.grey[400]!),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Image.network(
                                                    search[index].logoImage),
                                              )),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(left: 30, top: 5),
                                      child: Text(
                                        search[index].recruiteName,
                                        textAlign: TextAlign.center,
                                        style: titleStyle,
                                      ),
                                      // padding: EdgeInsets.only(top: 25, bottom: 70),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    search[index].recruiterAddress.isEmpty
                                        ? Container(height: 0, width: 0)
                                        : Container(
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.room,
                                                    color: iconColor,
                                                    size: 17,
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                    search[index]
                                                        .recruiterAddress,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'RobotoMono'),
                                                  ))
                                                ])),
                                    search[index].recruiterRegion.isEmpty
                                        ? Container(height: 0, width: 0)
                                        : Container(
                                            child: Text(
                                              search[index].recruiterRegion,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'RobotoMono'),
                                            ),
                                            //  padding: EdgeInsets.only(top: 25, bottom: 70),
                                          ),
                                    SizedBox(
                                      height: 19,
                                    ),
                                    search[index].recruiterCategory.isEmpty
                                        ? Container(height: 0, width: 0)
                                        : Container(
                                            margin: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.business,
                                                    color: iconColor,
                                                    size: 17,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      search[index]
                                                          .recruiterCategory,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'RobotoMono'),
                                                    ),
                                                    //  padding: EdgeInsets.only(top: 25, bottom: 70),
                                                  ),
                                                ])),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (search[index]
                                                .recruiterDescription
                                                .isEmpty)
                                        ? Container(height: 0, width: 0)
                                        : ExpansionTile(
                                            title: Text(
                                              'Description de l\'entreprise',
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Roboto',
                                                  fontSize: 15,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            children: [
                                                ListTile(
                                                  title: Html(
                                                      data: search[index]
                                                          .recruiterDescription),
                                                ),
                                              ]),
                                    SizedBox(height: 10)
                                  ],
                                ),
                                //Divider(),
                                /* Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 20),
                                          child: Icon(Icons.favorite_border)),
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Icon(Icons.share)),
                                    ],
                                  )
                                ]))*/
                              );
                      });
                },
                //childCount: search.length,
              );
            })));
  }
}
