import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';


abstract class ContactCenterServiceInterface {
  Future<dynamic> addForm(
      Map<String, dynamic> formData, String? phoneNumber , int? trainingId );
  Future<List<dynamic>> fetchChoice();
}

class  ContactCenterService extends ContactCenterServiceInterface {
  Dio dio;
  ContactCenterService(this.dio);

  final url = AppConfig.CONTACT_CENTER;

  @override
  Future<dynamic> addForm(
      Map<String, dynamic> formData, String? phoneNumber, int? trainingId) async {
    final data = Map<String, dynamic>.from(formData);
    final FormData form = FormData.fromMap({
      ...data,
      'phone': phoneNumber,
      'training' :  trainingId ,
    });
    try {
      final response = await dio.post(url, data: form);
      print(response);
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

  @override
  Future<List<dynamic>> fetchChoice() async {
    try {
          print('*********************');

      final response = await dio.request(
        AppConfig.CONTACT_CENTER,
        options: Options(method: 'OPTIONS'),
      );
      return response.data['actions']['POST']['you_are']['choices'];
    } catch (error) {
      rethrow;
    }
  }
}
