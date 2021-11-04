import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SearchEducationLevelServiceInterface {
  Future<Map<String, dynamic>?> fetchEducationLevel();
}

class SearchEducationLevelService extends SearchEducationLevelServiceInterface {
  Dio dio;
  SearchEducationLevelService(this.dio);

  @override
  Future<Map<String, dynamic>?> fetchEducationLevel() async {
    final url = '${AppConfig.EDUCATION_LEVEL_LIST}?&page_size=100';
    try {
      final response = await dio.get(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
