import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class ResetPasswordServiceInterface {
  Future<dynamic> resetPassword(email);
}

class ResetPasswordService extends ResetPasswordServiceInterface {
  final Dio dio;

  ResetPasswordService(this.dio);

  @override
  Future<dynamic> resetPassword(email) async {
    try {
      final response = await dio.post(AppConfig.RESET_PASSWORD,
          data: {'email' : email },
          queryParameters:
              Map<String, dynamic>.from({'auth_token': AppConfig.API_TOKEN}));
      print(response);
      return true;
    } on DioError catch (e) {
      if (e.response!.statusCode==400) {
        print(e.response!.data);
        return e.response!.data;
      } else {
        print(e.message);
        print(e.error);
      }
    }
  }
}
