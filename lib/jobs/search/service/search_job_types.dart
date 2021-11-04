import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SearchJobTypesInterface {
  Future<Map<String, dynamic>?> fetchJobTypes();
}

class SearchJobTypesService extends SearchJobTypesInterface {
  Dio dio;
  SearchJobTypesService(this.dio);

  @override
  Future<Map<String, dynamic>?> fetchJobTypes() async {
    final url = '${AppConfig.JOB_TYPE_LIST}?&page_size=100';
    try {
      final response = await dio.get(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
