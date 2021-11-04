import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keejob_mobile/authentication/pages/pages.dart';
import 'package:keejob_mobile/jobs/screens/apply_to_job_screen.dart';
import 'package:keejob_mobile/favorites/screens/favorite_list_screen.dart';
import 'package:keejob_mobile/jobs/screens/job_detail.dart';
import 'package:keejob_mobile/jobs/screens/job_detail_screen.dart';
import 'package:keejob_mobile/jobs/models/job.dart';
import 'package:keejob_mobile/applications/screens/application_list_screen.dart';
import 'package:keejob_mobile/jobs/screens/jobs_grid.dart';
import 'package:keejob_mobile/routes/fade_route.dart';
import 'package:keejob_mobile/signup/widgets/sign-up-grid.dart';
import 'package:keejob_mobile/trainings/contact_form_center.dart';
import 'package:keejob_mobile/trainings/models/training.dart';
import 'package:keejob_mobile/trainings/training_detail_screen.dart';
import 'package:keejob_mobile/user_profile/screens/user_profile_screen.dart';
import 'package:keejob_mobile/widgets/home_widget.dart';
import 'package:logging/logging.dart';

/// The [RouteType] determines what [PageRoute] is used for the new route.
///
/// This determines the transition animation for the new route.
enum RouteType {
  defaultRoute,
  fade,
}

final Logger _log = Logger('Keejob');

/// The [CustomNavigator] contains the [Navigator] key used by the root
/// [MaterialApp]. This allows for navigation without access to the
/// [BuildContext].
class CustomNavigator {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// A [Navigator] observer that is used to notify [RouteAware]s of changes to
  /// the state of their [Route].
  final RouteObserver<PageRoute<dynamic>> routeObserver =
      RouteObserver<PageRoute<dynamic>>();

  NavigatorState? get state => key.currentState;

  /// A convenience method to push a new [route] to the [Navigator].
  void pushRoute(Route<void> route) {
    key.currentState!.push<void>(route);
  }

  void pushNamedAndRemoveUntil(String route) {
    key.currentState!.pushNamedAndRemoveUntil(route, (route) => false);
  }

  /// A convenience method to push a named replacement route.
  void pushReplacementNamed(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    key.currentState!.pushReplacementNamed<void, void>(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }

  /// A convenience method to push a named route.
  void pushNamed(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    key.currentState!.pushNamed<void>(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }

  void pushTrainingDetails({int? trainingId, Training? training}) {
    pushNamed(TrainingDetailScreen.routeName,
        arguments: <String, dynamic>{
          'trainingId': trainingId,
          'training': training,
        },
        type: RouteType.fade);
  }

  void pushJobDetails({int? jobId, Job? job}) {
    pushNamed(JobDetailScreen.routeName,
        arguments: <String, dynamic>{
          'jobId': jobId,
          'job': job,
        },
        type: RouteType.fade);
  }

  void pushJobApplication({int? jobId, Job? job}) {
    pushNamed(ApplyToJobScreen.routeName,
        arguments: <String, dynamic>{
          'jobId': jobId,
          'job': job,
        },
        type: RouteType.fade);
  }

  void pushContactTrainingCenter({int? trainingId, Training? training}) {
    pushNamed(ContactTrainingCenterScreen.routeName,
        arguments: <String, dynamic>{
          'trainingId': trainingId,
          'training': training,
        },
        type: RouteType.fade);
  }

  void pushLoginWithNext({Job? job, String? nextRoute}) {
    pushReplacementNamed(LoginPage.routeName,
        arguments: <String, dynamic>{'job': job, 'nextRoute': nextRoute},
        type: RouteType.fade);
  }
}

/// [onGenerateRoute] is called whenever a new named route is being pushed to
/// the app.
///
/// The [RouteSettings.arguments] that can be passed along the named route
/// needs to be a `Map<String, dynamic>` and can be used to pass along
/// arguments for the screen.
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final String? routeName = settings.name;

  _log.fine('navigating to $routeName');
  Map<String?, dynamic> arguments = Map<String?, dynamic>();
  Widget screen;

  /*  final Map<String?, dynamic> arguments =
      settings.arguments as Map<String?, dynamic>;

  final RouteType routeType = arguments['routeType'] as RouteType;*/
  
  if (settings.arguments != null)
    arguments = settings.arguments as Map<String?, dynamic>;
  RouteType routeType = RouteType.defaultRoute;
  if (arguments['routeType'] != null)
    routeType = arguments['routeType'] as RouteType;

  switch (routeName) {
    case LoginPage.routeName:
      screen = LoginPage(nextRoute: arguments['nextRoute'] ?? '');
      break;
    case Home.routeName:
      screen = Home();
      break;
    case JobsGrid.routeName:
      screen = JobsGrid();
      break;
    case JobDetail.routeName:
      screen = JobDetail(
        jobId: arguments['jobId'],
      );
      break;
    case JobDetailScreen.routeName:
      screen = JobDetailScreen(
        jobId: arguments['jobId'],
        job: arguments['job'],
      );
      break;
    case ApplyToJobScreen.routeName:
      screen = ApplyToJobScreen(
        jobId: arguments['jobId'],
        job: arguments['job'],
      );
      break;
    case TrainingDetailScreen.routeName:
      screen = TrainingDetailScreen(
        trainingId: arguments['trainingId'],
        training: arguments['training'],
      );
      break;
    case ContactTrainingCenterScreen.routeName:
      screen = ContactTrainingCenterScreen(
        trainingId: arguments['trainingId'],
        training: arguments['training'],
      );
      break;
    case ApplicationsListScreen.routeName:
      screen = ApplicationsListScreen();
      break;
    case FavoriteListScreen.routeName:
      screen = FavoriteListScreen();
      break;
    case SignUpGrid.routeName:
      screen = SignUpGrid(
        finishSocialSignUp: arguments['finishSocialSignUp'] ?? false,
      );
      break;
    case UserProfileScreen.routeName:
      screen = Home(preSelectedTab: 3);
      break;
    default:
      _log.warning('route does not exist; navigating to login screen instead');
      screen = LoginPage();
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    case RouteType.defaultRoute:
    default:
      return CupertinoPageRoute<void>(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
  }
}
