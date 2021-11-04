import 'package:flutter/material.dart';
import 'package:keejob_mobile/config/AppLifecycleReactor.dart';
import 'package:keejob_mobile/jobs/screens/job_detail.dart';
import 'package:keejob_mobile/jobs/screens/jobs_overview_screen.dart';
import 'package:keejob_mobile/recruiters/screens/recruiter_screen.dart';
import 'package:keejob_mobile/trainings/trainings_overview_screen.dart';
import 'package:keejob_mobile/user_profile/screens/user_profile_screen.dart';

import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class Home extends StatefulWidget {
  static const routeName = '/home';
  final int? preSelectedTab;

  Home({this.preSelectedTab});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends LifecycleWatcherState<Home> {
  int _currentIndex = 0;
  String? initialLink = '';
  String id = '';
  String? url;

  void initUniLinks(msg) async {
    print("i'm in " + msg);
    try {
      initialLink = await getInitialLink();
      if (initialLink != null) {
        url = initialLink!
            .toString()
            .substring(37, initialLink.toString().length - 1);
        id = url.toString().substring(0, 6);
        setState(() {
          initialLink = initialLink;
          print('url ' + initialLink!);
          id = id;
             print('§§§§§§§§§§§§§§§!');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JobDetail(jobId: int.parse(id))),
            );

        });
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?0
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initUniLinks('initState');

    if (widget.preSelectedTab != null) {
      setState(() {
        _currentIndex = widget.preSelectedTab!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationBar = BottomNavigationBar(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: _onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue[800],
      selectedIconTheme: IconThemeData(size: 25, color: Colors.blue[800]),
      unselectedIconTheme: IconThemeData(size: 20, color: Colors.grey[700]),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline),
          label: 'Emplois',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Formations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Entreprises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Compte',
        ),
      ],
    );

    final List<dynamic> _children = [
      JobsOverviewScreen(navigationBar),
      TrainingsOverviewScreen(navigationBar),
      RecruiterScreen(navigationBar),
      UserProfileScreen(navigationBar),
    ];

    return _children[_currentIndex];
  }

  @override
  void onDetached() {
    initUniLinks('onDetached');
  }

  @override
  void onInactive() {
    initUniLinks('onInactive');
  }

  @override
  void onPaused() {
    initUniLinks('onPaused');
  }

  @override
  void onResumed() {
    initUniLinks('onResumed');
  }
}
