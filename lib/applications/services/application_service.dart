import 'package:dio/dio.dart';
import 'package:keejob_mobile/applications/models/application.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/jobs/models/job.dart';

abstract class ApplicationServiceInterface {
  Future<dynamic> addApplication(Map<String, dynamic> formData, String? degree,
      String? phoneNumber, int? cv, int? jobId);

  Future<List<Job>> getApplication();

  Future<List<int>> getApp();

  Future<List<Application>> fetchApplications();
}

class ApplicationService extends ApplicationServiceInterface {
  Dio dio;

  ApplicationService(this.dio);

  final url = AppConfig.APPLICATION;

  @override
  Future<dynamic> addApplication(Map<String, dynamic> formData, String? degree,
      String? phoneNumber, int? cv, int? jobId) async {
    FormData form;
    final data = Map<String, dynamic>.from(formData);
    if (cv == null) {
      form = FormData.fromMap({
        ...data,
        'job': jobId,
        'phone_numbers': phoneNumber,
        'degree_level': degree
      });
    } else {
      form = FormData.fromMap({
        ...data,
        'job': jobId,
        'attached_docs': cv,
        'phone_numbers': phoneNumber,
        'degree_level': degree
      });
    }

    try {
       await dio.post(url, data: form);
      return true;
    } on DioError catch (e) {
      print(e.response);
      if (e.response!.statusCode == 400) {
        print(e.response!.data);
        return e.response!.data;
      } else if (e.response!.statusCode == 500) {
        print(e.response!.data);
        return e.response!.statusCode;
      } else {
        print(e.message);
        print(e.error);
      }
    }
  }

  @override
  Future<List<Job>> getApplication() async {
    try {
      final response = await dio.get(url);
      print(response);
      final extractedData = response.data;
      if (extractedData == null) {
        return [];
      }
      final List<Job> loadedApplication = [];
      extractedData['results'].forEach((prodData) {
        loadedApplication.add(Job.fromJson(prodData['job_details']));
      });
      return loadedApplication;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  @override
  Future<List<Application>> fetchApplications() async {
    try {
      final response = await dio.get(url);
      final extractedData = response.data;
      if (extractedData == null) {
        return [];
      }
      final List<Application> loadedApplication = [];
      extractedData['results'].forEach((prodData) {
        loadedApplication.add(Application.fromJson(prodData));
      });
      return loadedApplication;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  @override
  Future<List<int>> getApp() async {
    try {
      final response = await dio.get(url);
      print(response);
      final extractedData = response.data;
      if (extractedData == null) {
        return [];
      }
      final List<int> loadedApplication = [];
      extractedData['results'].forEach((prodData) {
        loadedApplication.add(prodData['job_details']['id']);
      });
      return loadedApplication;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
