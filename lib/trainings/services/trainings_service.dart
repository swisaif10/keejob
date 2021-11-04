import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/trainings/search_trainings/search_all/bloc/search_training_parameters_state.dart';
import 'package:keejob_mobile/trainings/search_trainings/search_all/bloc/search_training_parameters_bloc.dart';
import 'package:tuple/tuple.dart';
import '../models/training.dart';

abstract class TrainingsServiceInterface {
  Future<Tuple2<int?, List<Training>>> fetchTrainings(
      int pageSize, int pageNumber);
  Future<Training?> fetchTraining(int trainingId);
}

class TrainingsService extends TrainingsServiceInterface {
  final Dio? dio;

  TrainingsService(this.dio);

  @override
  Future<Tuple2<int?, List<Training>>> fetchTrainings(
      int pageSize, int pageNumber) async {
    final url = AppConfig.TRAININGS_LIST;
    SearchTrainingParametersBloc searchTrainingBloc =
        Injector.resolve<SearchTrainingParametersBloc>();
    var filterData = {
      'auth_token': AppConfig.API_TOKEN,
      'page_size': pageSize,
      'page': pageNumber,
    };
    if (searchTrainingBloc.state is Saved) {
      final state = searchTrainingBloc.state as Saved;
      if (state.keyword != null) {
        filterData['keywords'] = state.keyword!;
      }
      if (state.domainName != null && state.domainName != 0) {
        filterData['training_domain'] = state.domainName!;
      }
      if (state.localities.isNotEmpty) {
        // localities url filter use the syntax &localities[1,2,3]
        filterData['region'] = '[${state.localities.join(',')}]';
      }
    }
    try {
      final response = await dio!
          .get(url, queryParameters: Map<String, dynamic>.from(filterData));
      final extractedData = response.data;
      if (extractedData == null) {
        return Tuple2(null, []);
      }

      final List<Training> loadedTraining = [];
      extractedData['results'].forEach((prodData) {
        print('******************');
        loadedTraining.add(Training.fromJson(prodData));
      });

      return Tuple2(extractedData['next_page_number'], loadedTraining);
    } catch (error) {
      print('***************');
      print(error);
      rethrow;
    }
  }

  @override
  Future<Training?> fetchTraining(int trainingId) async {
    final url = AppConfig.training_details(trainingId) +
        '?auth_token=${AppConfig.API_TOKEN}';
    try {
      final response = await dio!.get(url);
      final extractedData = response.data;
      if (extractedData == null) {
        return null;
      }
      return Training.fromJson(extractedData);
    } catch (error) {
      rethrow;
    }
  }
}
