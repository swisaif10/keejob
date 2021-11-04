import 'package:dio/dio.dart';
import 'package:keejob_mobile/authentication/models/models.dart';
import 'package:keejob_mobile/config/app_config.dart';

class JwtInterceptor extends Interceptor {
  List<String> excludedPaths = [
    AppConfig.AUTH_TOKEN_REFRESH,
    AppConfig.AUTH_SIGN_IN,
  ];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!excludedPaths.any((element) => options.path.contains(element))) {
      final User? user = await User.loadFromSharedPreferences();
      if (user != null) {
        // If user is authenticated, we do not need the global token
        if (options.queryParameters.containsKey('auth_token')) {
          options.queryParameters.remove('auth_token');
        }
        options.headers.addAll({
          'Authorization': 'Bearer ${user.access}',
        });
      }
    }
    handler.next(options);
  }
}
