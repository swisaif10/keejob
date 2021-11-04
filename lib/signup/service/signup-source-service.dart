import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SignUpSourceServiceInterface {
  Future<List<dynamic>> fetchSignUpSource();
}

class SignUpSourceService extends SignUpSourceServiceInterface {
  Dio dio;

  SignUpSourceService(this.dio);
  @override
  Future<List<dynamic>> fetchSignUpSource() async {
    try {
      final response = await dio.request(
        AppConfig.SIGN_UP,
        options: Options(method: 'OPTIONS'),
      );
      return response.data['actions']['POST']['signup_source']['choices'];
    } catch (error) {
      rethrow;
    }
  }
}
