import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SearchExperienceLevelInterface {
  Future<Map<String, dynamic>?> fetchExperienceLevel();
}

class SearchExperienceLevelService extends SearchExperienceLevelInterface {
  Dio dio;
  SearchExperienceLevelService(this.dio);

  @override
  Future<Map<String, dynamic>> fetchExperienceLevel() async {
    final url = '${AppConfig.EXPERIENCE_LEVEL_LIST}?&page_size=100';
    try {
      final response = await dio.get(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
