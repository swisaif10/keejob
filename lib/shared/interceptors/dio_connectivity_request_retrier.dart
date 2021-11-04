import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Injector.resolve<GlobalMessageService>().hideCurrent();
      Injector.resolve<GlobalMessageService>().show(
        'Aucune connexion internet...',
      );
    }

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription.cancel();
          // Complete the completer instead of returning
          Injector.resolve<GlobalMessageService>().show('Retour en ligne!');
          responseCompleter.complete(dio.fetch(requestOptions));
        }
      },
    );

    return responseCompleter.future;
  }
}
