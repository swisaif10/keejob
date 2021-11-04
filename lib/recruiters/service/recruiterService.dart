import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/recruiters/model/recruiter.dart';
import 'package:tuple/tuple.dart';

abstract class RecruiterServiceInterface {
  Future<Tuple2<String?, List<Recruiter>>> fetchRecruiters(
      String? pagedUrl, int pageSize);
  Future<Recruiter?> fetchRecruiter(int recruiterId);
}

class RecruiterService extends RecruiterServiceInterface {
  Dio dio;

  RecruiterService(this.dio);

  @override
  Future<Tuple2<String?, List<Recruiter>>> fetchRecruiters(
      String? pagedUrl, int pageSize) async {
    final url = pagedUrl ??
        '${AppConfig.RECRUITER_LIST}?auth_token=${AppConfig.API_TOKEN}';

    try {
      final response = await dio.get(url);
      final extractedData = response.data;
      if (extractedData == null) {
        return Tuple2(null, []);
      }
      final List<Recruiter> loadedJobs = [];
      extractedData['results'].forEach((prodData) {
        loadedJobs.add(Recruiter.fromJson(prodData));
      });
      return Tuple2(extractedData['next'], loadedJobs);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Recruiter?> fetchRecruiter(int recruiterId) async {
    final url = AppConfig.recruiter_details(recruiterId) +
        '?auth_token=${AppConfig.API_TOKEN}';
    try {
      final response = await dio.get(url);
      final extractedData = response.data;

      if (extractedData == null) {
        return null;
      }
      final Recruiter loadedRecruiter = Recruiter.fromJson(extractedData);

      return loadedRecruiter;
    } catch (error) {
      rethrow;
    }
  }
}
