import 'package:connectivity/connectivity.dart';
import 'package:keejob_mobile/applications/bloc/application_bloc.dart';
import 'package:keejob_mobile/authentication/blocs/blocs.dart';
import 'package:keejob_mobile/applications/services/application_service.dart';
import 'package:keejob_mobile/authentication/services/reset_password_service.dart';
import 'package:keejob_mobile/favorites/bloc/favorite_bloc.dart';
import 'package:keejob_mobile/jobs/services/cover_letter_service.dart';
import 'package:keejob_mobile/jobs/services/documents_service.dart';
import 'package:keejob_mobile/favorites/services/favorite_job.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiter_bloc.dart';
import 'package:keejob_mobile/recruiters/bloc/recruiters_list_bloc.dart';
import 'package:keejob_mobile/recruiters/service/recruiterService.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/job_types_bloc/job_types_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/profession_bloc/search_profession_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/service/search_education_level.dart';
import 'package:keejob_mobile/jobs/search/service/search_experience_level.dart';
import 'package:keejob_mobile/jobs/search/service/search_job_types.dart';
import 'package:keejob_mobile/jobs/search/service/search_locality.dart';
import 'package:keejob_mobile/jobs/search/service/search_profession.dart';
import 'package:keejob_mobile/shared/interceptors/dio_connectivity_request_retrier.dart';
import 'package:keejob_mobile/shared/interceptors/jwt_interceptor.dart';
import 'package:keejob_mobile/shared/interceptors/retry_interceptor.dart';
import 'package:keejob_mobile/shared/services/analytics_service.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/signup/bloc/country_list_bloc.dart';
import 'package:keejob_mobile/signup/service/country-service.dart';
import 'package:keejob_mobile/signup/service/sign-up-service.dart';
import 'package:keejob_mobile/signup/service/signup-source-service.dart';
import 'package:keejob_mobile/trainings/bloc/training_list_bloc.dart';
import 'package:keejob_mobile/trainings/services/center_contact_service.dart';
import 'package:kiwi/kiwi.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:keejob_mobile/authentication/blocs/authentication/authentication_bloc.dart';
import 'package:keejob_mobile/authentication/services/services.dart';
import 'package:keejob_mobile/jobs/bloc/job_bloc.dart';
import 'package:keejob_mobile/jobs/bloc/jobs_list_bloc.dart';
import 'package:keejob_mobile/jobs/services/jobs_service.dart';
import 'package:keejob_mobile/trainings/bloc/training_bloc.dart';
import 'package:keejob_mobile/trainings/services/trainings_service.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_bloc.dart';
import 'package:keejob_mobile/user_profile/services/userprofile_service.dart';

import 'trainings/search_trainings/search_all/bloc/search_training_parameters_bloc.dart';
import 'trainings/search_trainings/search_domain_name/bloc/search_training_bloc.dart';
import 'trainings/search_trainings/search_domain_name/services/search_training.dart';
part 'injector.g.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class Injector {
  static late KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureCore();
    _configureFeatureModule();
  }

  // Core module
  void _configureCore() {
    final dio = Dio();
    dio.interceptors.add(RetryOnConnectionChangeInterceptor(
      requestRetrier: DioConnectivityRequestRetrier(
        dio: dio,
        connectivity: Connectivity(),
      ),
    ));

    dio.interceptors.add(JwtInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError e, handler) {
        print('ERROR');
        print('URI: ${e.requestOptions.uri}');
        if (e.response != null) {
          print('status code: ${e.response!.statusCode}');
          if (e.response!.data != null) {
            print('response data ${e.response!.data}');
          }
        }
        return handler.next(e);
      },
    ));
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    container.registerInstance(dio);
  }

  // Feature module
  void _configureFeatureModule() {
    _configureAuthenticationFeatureModuleFactories();
    _configureJobsFeatureModuleFactories();
    _configureTrainingsFeatureModuleFactories();
    _configureUserProfileFeatureModuleFactories();
    _configureSearchEducationLevelFeatureModuleFactories();
    _configureSearchProfessionFeatureModuleFactories();
    _configureSearchJobTypesFeatureModuleFactories();
    _configureSearchLocaliteFeatureModuleFactories();
    _configureSearchExperienceLevelFeatureModuleFactories();
    _configureSearchTrainingsFeatureModuleFactories();
    _configureRecruiterFeatureModuleFactories();
    _configureCountriesFeatureModuleFactories();
    _configureSignUpSourceFeatureModuleFactories();
    _configureSignUpFeatureModuleFactories();
    _configureApplicationFeatureModuleFactories();
    _configureDocumentFeatureModuleFactories();
    _configureCoverLetterFeatureModuleFactories();
    _configureFavoriteJobFeatureModuleFactories();
    _configureContactCenterFeatureModuleFactories();
    _configureResetPasswordFeatureModuleFactories();
    _configureShared();
  }

  // Register Feature module Factories

  @Register.singleton(AuthenticationService, from: ApiAuthenticationService)
  @Register.singleton(AuthenticationBloc)
  @Register.factory(LoginBloc)
  void _configureAuthenticationFeatureModuleFactories();

  @Register.singleton(JobsServiceInterface, from: JobsService)
  @Register.factory(JobsListBloc)
  @Register.factory(JobBloc)
  @Register.singleton(SearchParametersBloc)
  void _configureJobsFeatureModuleFactories();

  @Register.singleton(TrainingsServiceInterface, from: TrainingsService)
  @Register.factory(TrainingListBloc)
  @Register.factory(TrainingBloc)
  @Register.singleton(SearchTrainingParametersBloc)
  void _configureTrainingsFeatureModuleFactories();

  @Register.singleton(SearchTrainingServiceInterface,
      from: SearchTrainingService)
  @Register.singleton(SearchTrainingListBloc)
  void _configureSearchTrainingsFeatureModuleFactories();

  @Register.singleton(UserProfileServiceInterface, from: UserProfileService)
  @Register.factory(UserProfileBloc)
  void _configureUserProfileFeatureModuleFactories();

  @Register.singleton(SearchEducationLevelServiceInterface,
      from: SearchEducationLevelService)
  @Register.singleton(SearchEducationLevelBloc)
  void _configureSearchEducationLevelFeatureModuleFactories();

  @Register.singleton(SearchProfessionServiceInterface,
      from: SearchProfessionService)
  @Register.singleton(SearchProfessionListBloc)
  void _configureSearchProfessionFeatureModuleFactories();

  @Register.factory(SearchJobTypesInterface, from: SearchJobTypesService)
  @Register.singleton(SearchJobTypesBloc)
  void _configureSearchJobTypesFeatureModuleFactories();

  @Register.factory(SearchLocalityInterface, from: SearchLocalityService)
  @Register.singleton(SearchLocalityBloc)
  void _configureSearchLocaliteFeatureModuleFactories();

  @Register.factory(SearchExperienceLevelInterface,
      from: SearchExperienceLevelService)
  @Register.singleton(SearchExperienceLevelBloc)
  void _configureSearchExperienceLevelFeatureModuleFactories();

  @Register.factory(RecruiterServiceInterface, from: RecruiterService)
  @Register.factory(RecruitersListBloc)
  @Register.factory(RecruiterBloc)
  void _configureRecruiterFeatureModuleFactories();

  @Register.factory(CountryServiceInterface, from: CountryService)
  @Register.factory(CountryListBloc)
  void _configureCountriesFeatureModuleFactories();

  @Register.factory(SignUpSourceServiceInterface, from: SignUpSourceService)
  void _configureSignUpSourceFeatureModuleFactories();

  @Register.factory(ApplicationServiceInterface, from: ApplicationService)
  @Register.factory(ApplicationListBloc)
  void _configureApplicationFeatureModuleFactories();

  @Register.factory(SignUpServiceInterface, from: SignUpService)
  void _configureSignUpFeatureModuleFactories();

  @Register.factory(ContactCenterServiceInterface, from: ContactCenterService)
  void _configureContactCenterFeatureModuleFactories();

  @Register.factory(DocumentServiceInterface, from: DocumentService)
  void _configureDocumentFeatureModuleFactories();

  @Register.factory(CoverLetterServiceInterface, from: CoverLetterService)
  void _configureCoverLetterFeatureModuleFactories();

  @Register.factory(ResetPasswordServiceInterface, from: ResetPasswordService)
  void _configureResetPasswordFeatureModuleFactories();

  @Register.factory(FavoriteJobServiceInterface, from: FavoriteJobService)
  @Register.factory(FavoriteListBloc)
  void _configureFavoriteJobFeatureModuleFactories();

  @Register.singleton(GlobalMessageService)
  @Register.singleton(CustomNavigator)
  @Register.singleton(AnalyticsService)
  void _configureShared();
}
