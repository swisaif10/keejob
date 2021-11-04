import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SignUpServiceInterface {
  Future<dynamic> signUp(
      Map<String, dynamic> formData, String? phoneNumber, bool isSocialSignup);
}

class SignUpService extends SignUpServiceInterface {
  final Dio dio;

  SignUpService(this.dio);

  @override
  Future<dynamic> signUp(Map<String, dynamic> formData, String? phoneNumber,
      bool isSocialSignup) async {
    FormData form;
    final url = isSocialSignup
        ? AppConfig.AUTH_SIGNIN_SOCIAL_COMPLETE
        : AppConfig.SIGN_UP;
    final cv = formData['cv'];
    final data = Map<String, dynamic>.from(formData);
    if (data['birth_date'] != null) {
      data['birth_date'] = AppConfig.DATE_FORMAT.format(data['birth_date']);
    }
    data.remove('cv');

    if (isSocialSignup) {
      data.remove('email');
    }

    if (cv == null || cv.isEmpty) {
      form = FormData.fromMap({
        ...data,
        'phone_numbers': phoneNumber,
      });
    } else {
      final PlatformFile _cv = cv.first;
      form = FormData.fromMap({
        ...data,
        'phone_numbers': phoneNumber,
        'cv': await MultipartFile.fromFile(_cv.path!,
            filename: _cv.path!.split('/').last),
      });
    }

    try {
      await dio.post(url, data: form);
      return true;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print(e.response!.data);
        return e.response!.data;
      } else {
        print(e.message);
        print(e.error);
      }
    }
  }
}
