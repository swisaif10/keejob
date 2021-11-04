import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class CountryServiceInterface {
  Future<List<dynamic>> fetchCountry();
}

class CountryService extends CountryServiceInterface {
  Dio dio ;
  CountryService(this.dio);
  @override
    Future<List<dynamic>> fetchCountry() async {
    final url =  AppConfig.COUNTRY_LIST+'?auth_token=${AppConfig.API_TOKEN}';

    try {
      final response = await dio.get(url);
      final extractedData = response.data;

      if (extractedData == null) {
        return [];
      }
      final List<dynamic> loadedJobs = [];
      extractedData['results'].forEach((prodData) {
        loadedJobs.add(prodData);
      });
      return loadedJobs;
    } catch (error) {
      rethrow;
    }
  }
}
