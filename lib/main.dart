import 'dart:async';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/notifiication/service.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/shared/global_bloc_provider.dart';
import 'package:keejob_mobile/shared/global_message.dart';
import 'package:keejob_mobile/shared/logger/init_logger.dart';
import 'package:keejob_mobile/shared/services/analytics_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './app_loading.dart';
import './config/app_config.dart';
import './injector.dart';
import './widgets/home_widget.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import './simple_bloc_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void runApplication() {
  runZonedGuarded(
    () => runApp(MyApp()),
    (error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
    },
  );
}

int? isviewed;

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
final pushNotificationService = PushNotificationService(_firebaseMessaging);

Future<void> main() async {
  initLogger();
  if (AppConfig.IS_DEBUG_MODE) {
    Bloc.observer = SimpleBlocObserver();
  }
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  FlutterError.onError = (details) {
    print(details.exceptionAsString());
    print(details.stack.toString());
  };
  Injector.setup();
  await Firebase.initializeApp();
  pushNotificationService.initialise();
  loadFilters();
  if (AppConfig.IS_RELEASE_MODE) {
    await SentryFlutter.init(
      (options) => options.dsn = AppConfig.SENTRY_DSN,
      appRunner: () => runApplication(),
    );
  } else {
    runApplication();


  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GlobalBlocProvider(
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('fr', ''),
        ],
        debugShowCheckedModeBanner: false,
        navigatorKey: Injector.resolve<CustomNavigator>().key,
        onGenerateRoute: onGenerateRoute,
          home: Home(),
        //isviewed != 0 ? OnBoard() : Home(),
        builder: (BuildContext widget, Widget? child) =>
            GlobalMessage(child: child!),
        navigatorObservers: <NavigatorObserver>[
          FirebaseAnalyticsObserver(
            analytics: Injector.resolve<AnalyticsService>().analytics,
            nameExtractor: screenNameExtractor,
          ),
          Injector.resolve<CustomNavigator>().routeObserver,
        ],
      ),
    );
  }
}
