import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';

abstract class DocumentServiceInterface {
  Future<List<dynamic>> addDocument();
}

class DocumentService extends DocumentServiceInterface {
  Dio dio;

  DocumentService(this.dio);

  final url = AppConfig.DOCUMENT;

  @override
  Future<List<dynamic>> addDocument() async {

    try {
      final response = await dio.get(url);
      final extractedData = response.data;

      if (extractedData == null) {
        return [];
      }
      final loadedDocuments = [];
      extractedData['results'].forEach((prodData) {
        loadedDocuments.add(prodData);
      });
      return loadedDocuments ;
    } catch (error) {
      rethrow;
    }
  }
}
