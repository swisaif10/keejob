import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class CoverLetterServiceInterface {
  Future<List<dynamic>> getCoverLetters();
}

class CoverLetterService extends CoverLetterServiceInterface {
  Dio dio;

  CoverLetterService(this.dio);

  final url = AppConfig.COVER_LETTER;

  @override
  Future<List<dynamic>> getCoverLetters() async {
    try {
      final response = await dio.get(url);
      final extractedData = response.data;

      if (extractedData == null) {
        return [];
      }
      final loadedCoverLetter = [];
      extractedData['results'].forEach((prodData) {
        print(prodData);
        loadedCoverLetter.add(prodData);
      });
      return loadedCoverLetter;
    } catch (error) {
      rethrow;
    }
  }
}
