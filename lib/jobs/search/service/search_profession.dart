import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';
import '../models/profession.dart';

abstract class SearchProfessionServiceInterface {
  Future<List<Profession>> fetchProfession();
}

class SearchProfessionService extends SearchProfessionServiceInterface {
  Map<String, dynamic>? map;
  List<Profession>? data;
  Dio? dio;
  SearchProfessionService(this.dio);

  @override
  Future<List<Profession>> fetchProfession() async {
    final url = '${AppConfig.PROFESSION_LIST}?&page_size=1000';
    try {
      final response = await dio!.get(url);
      final extractedData = response.data;
      if (extractedData == null) {
        return [];
      }
      final List<Profession> loadedJobs = [];
      extractedData['results'].forEach((prodData) {
        loadedJobs.add(Profession.fromJson(prodData));
      });
      return loadedJobs;
    } catch (error) {
      rethrow;
    }
  }
}
