import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/favorites/models/favorite.dart';

abstract class FavoriteJobServiceInterface {
  Future<dynamic> addToFavorite(int? jobId);
  Future<dynamic> deleteFromFavorite(int? jobId);
  Future<List<FavoriteJob>> getListFavorite();
}

class FavoriteJobService extends FavoriteJobServiceInterface {
  Dio dio;

  FavoriteJobService(this.dio);

  final url = AppConfig.FAVORITE_JOB;

  @override
  Future<dynamic> deleteFromFavorite(int? jobId) async {
    final url_delete = url + jobId.toString() + '/';
    print(url_delete);
    try {
      final response = await dio.delete(url_delete);
      print('delete');
      print(response);

      return true;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.data);
        return e.response!.data;
      } else {
        print(e.message);
        print(e.error);
      }
    }
  }

  @override
  Future<List<FavoriteJob>> getListFavorite() async {
    try {
      final response = await dio.get(url);
      final extractedData = response.data;
      if (extractedData == null) {
        return [];
      }
      final List<FavoriteJob> loadedFavorite = [];
      extractedData['results'].forEach((prodData) {
        loadedFavorite.add(FavoriteJob.fromJson(prodData));
      });

      return loadedFavorite;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  @override
  Future<dynamic> addToFavorite(int? jobId) async {
    try {
      print(jobId);
      final response = await dio.post(url, data: {'job': jobId});
      print('adddddddddddddddd');
      print(response);

      return true;
    } on DioError catch (e) {
      print(e.response!.statusCode);
      if (e.response!.statusCode == 400) {
        print(e.response!.data);
        return e.response!.statusCode;
      } else {
        print(e.message);
        print(e.error);
      }
    }
  }
}
