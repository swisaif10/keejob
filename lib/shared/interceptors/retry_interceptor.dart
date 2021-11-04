import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    bool handled = false;
    if (_shouldRetry(err)) {
      try {
        Injector.resolve<GlobalMessageService>().show('Something went wrong!');
        final response =
            await requestRetrier.scheduleRequestRetry(err.requestOptions);
        handler.resolve(response);
        handled = true;
      } catch (e) {
        Injector.resolve<GlobalMessageService>().show('Something went wrong!');
        // Let any new error from the retrier pass through
        print(e);
      }
    }
    if (!handled) {
      // Let the error pass through if it's not the error we're looking for
      handler.next(err);
    }
  }

  bool _shouldRetry(DioError err) {
    return err.error != null && err.error is SocketException;
  }
}
