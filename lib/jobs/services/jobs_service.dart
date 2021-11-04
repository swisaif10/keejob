import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/models/job.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart';
import 'package:tuple/tuple.dart';

abstract class JobsServiceInterface {
  Future<Tuple2<int?, List<Job>>> fetchJobs(int pageSize, int pageNumber);
  Future<Job?> fetchJob(int jobId);
}

class JobsService extends JobsServiceInterface {
  final Dio dio;

  JobsService(this.dio);

  @override
  Future<Tuple2<int?, List<Job>>> fetchJobs(
      int pageSize, int pageNumber) async {
    final url = AppConfig.JOBS_LIST;
    SearchParametersBloc searchBloc = Injector.resolve<SearchParametersBloc>();
    var filterData = {
      'auth_token': AppConfig.API_TOKEN,
      'page_size': pageSize,
      'page': pageNumber,
    };
    if (searchBloc.state is Saved) {
      final state = searchBloc.state as Saved;
      if (state.keyword != null && state.keyword != '') {
        filterData['keywords'] = state.keyword!;
      }
      if (state.education != null && state.education != 0) {
        filterData['education_level'] = state.education!;
      }
      if (state.experienceLevel != null && state.experienceLevel != 0) {
        filterData['experience_level'] = state.experienceLevel!;
      }
      if (state.localities.isNotEmpty) {
        // localities url filter use the syntax &localities[1,2,3]
        filterData['localities'] = '[${state.localities.join(',')}]';
      }
      if (state.professions.isNotEmpty) {
        // professions url filter use the syntax &professions[1,2,3]
        filterData['professions'] = '[${state.professions.join(',')}]';
      }
      if (state.jobTypes.isNotEmpty) {
        // Job types url filter use the syntax &job_types=5&job_types=3
        filterData['job_types'] = state.jobTypes;
      }
    }
    try {
      final response = await dio.get(url,
          queryParameters: Map<String, dynamic>.from(filterData));
      final extractedData = response.data;
      if (extractedData == null) {
        return Tuple2(null, []);
      }
      final List<Job> loadedJobs = [];

      extractedData['results'].forEach((prodData) {
        loadedJobs.add(Job.fromJson(prodData));
      });
      return Tuple2(extractedData['next_page_number'], loadedJobs);
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  @override
  Future<Job?> fetchJob(int jobId) async {
    final url =
        AppConfig.job_details(jobId) + '?auth_token=${AppConfig.API_TOKEN}';
    try {
      final response = await dio.get(url);
      final extractedData = response.data;
      if (extractedData == null) {
        return null;
      }
      final Job loadedJob = Job.fromJson(extractedData);
      return loadedJob;
    } catch (error) {
      rethrow;
    }
  }
}
