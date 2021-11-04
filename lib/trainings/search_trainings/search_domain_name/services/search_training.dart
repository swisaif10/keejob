import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class SearchTrainingServiceInterface {
  Future<List<dynamic>> fetchTraining(int pageSize);
}

class SearchTrainingService extends SearchTrainingServiceInterface {
  Dio? dio;
  SearchTrainingService(this.dio);

  @override
  Future<List<dynamic>> fetchTraining(int pageSize) async {
    try {
      final response = await dio!.get(AppConfig.DOMAIN_LIST);
      final extractedData = response.data;

      if (extractedData == null) {
        return [];
      }
      final List<dynamic> loadedTraining = [];
      extractedData['results'].forEach((prodData) {
        loadedTraining.add(prodData);
      });
      return loadedTraining;
    } catch (error) {
      rethrow;
    }
  }
}
