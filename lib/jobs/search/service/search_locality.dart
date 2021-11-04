import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SearchLocalityInterface {
  Future<dynamic> fetchLocality();
}

class SearchLocalityService extends SearchLocalityInterface {
  Dio dio;
  SearchLocalityService(this.dio);

  @override
  Future<dynamic> fetchLocality() async {
    final url = '${AppConfig.LOCALITY_LIST}?&page_size=1000';

    try {
      final response = await dio.get(url);
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
