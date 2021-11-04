// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureAuthenticationFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<AuthenticationService>(
        (c) => ApiAuthenticationService(c<Dio>()));
    container.registerSingleton(
        (c) => AuthenticationBloc(c<AuthenticationService>()));
    container.registerFactory(
        (c) => LoginBloc(c<AuthenticationBloc>(), c<AuthenticationService>()));
  }

  @override
  void _configureJobsFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton<JobsServiceInterface>((c) => JobsService(c<Dio>()));
    container.registerFactory((c) => JobsListBloc(c<JobsServiceInterface>()));
    container.registerFactory((c) => JobBloc(c<JobsServiceInterface>()));
    container.registerSingleton((c) => SearchParametersBloc());
  }

  @override
  void _configureTrainingsFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<TrainingsServiceInterface>(
        (c) => TrainingsService(c<Dio>()));
    container.registerFactory(
        (c) => TrainingListBloc(c<TrainingsServiceInterface>()));
    container
        .registerFactory((c) => TrainingBloc(c<TrainingsServiceInterface>()));
    container.registerSingleton((c) => SearchTrainingParametersBloc());
  }

  @override
  void _configureSearchTrainingsFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<SearchTrainingServiceInterface>(
        (c) => SearchTrainingService(c<Dio>()));
    container.registerSingleton(
        (c) => SearchTrainingListBloc(c<SearchTrainingServiceInterface>()));
  }

  @override
  void _configureUserProfileFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<UserProfileServiceInterface>(
        (c) => UserProfileService(c<Dio>()));
    container.registerFactory(
        (c) => UserProfileBloc(c<UserProfileServiceInterface>()));
  }

  @override
  void _configureSearchEducationLevelFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<SearchEducationLevelServiceInterface>(
        (c) => SearchEducationLevelService(c<Dio>()));
    container.registerSingleton((c) =>
        SearchEducationLevelBloc(c<SearchEducationLevelServiceInterface>()));
  }

  @override
  void _configureSearchProfessionFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<SearchProfessionServiceInterface>(
        (c) => SearchProfessionService(c<Dio>()));
    container.registerSingleton(
        (c) => SearchProfessionListBloc(c<SearchProfessionServiceInterface>()));
  }

  @override
  void _configureSearchJobTypesFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SearchJobTypesInterface>(
        (c) => SearchJobTypesService(c<Dio>()));
    container.registerSingleton(
        (c) => SearchJobTypesBloc(c<SearchJobTypesInterface>()));
  }

  @override
  void _configureSearchLocaliteFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SearchLocalityInterface>(
        (c) => SearchLocalityService(c<Dio>()));
    container.registerSingleton(
        (c) => SearchLocalityBloc(c<SearchLocalityInterface>()));
  }

  @override
  void _configureSearchExperienceLevelFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SearchExperienceLevelInterface>(
        (c) => SearchExperienceLevelService(c<Dio>()));
    container.registerSingleton(
        (c) => SearchExperienceLevelBloc(c<SearchExperienceLevelInterface>()));
  }

  @override
  void _configureRecruiterFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<RecruiterServiceInterface>(
        (c) => RecruiterService(c<Dio>()));
    container.registerFactory(
        (c) => RecruitersListBloc(c<RecruiterServiceInterface>()));
    container
        .registerFactory((c) => RecruiterBloc(c<RecruiterServiceInterface>()));
  }

  @override
  void _configureCountriesFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<CountryServiceInterface>(
        (c) => CountryService(c<Dio>()));
    container
        .registerFactory((c) => CountryListBloc(c<CountryServiceInterface>()));
  }

  @override
  void _configureSignUpSourceFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SignUpSourceServiceInterface>(
        (c) => SignUpSourceService(c<Dio>()));
  }

  @override
  void _configureApplicationFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<ApplicationServiceInterface>(
        (c) => ApplicationService(c<Dio>()));
    container.registerFactory(
        (c) => ApplicationListBloc(c<ApplicationServiceInterface>()));
  }

  @override
  void _configureSignUpFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<SignUpServiceInterface>(
        (c) => SignUpService(c<Dio>()));
  }

  @override
  void _configureContactCenterFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<ContactCenterServiceInterface>(
        (c) => ContactCenterService(c<Dio>()));
  }

  @override
  void _configureDocumentFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<DocumentServiceInterface>(
        (c) => DocumentService(c<Dio>()));
  }

  @override
  void _configureCoverLetterFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<CoverLetterServiceInterface>(
        (c) => CoverLetterService(c<Dio>()));
  }

  @override
  void _configureResetPasswordFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<ResetPasswordServiceInterface>(
        (c) => ResetPasswordService(c<Dio>()));
  }

  @override
  void _configureFavoriteJobFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory<FavoriteJobServiceInterface>(
        (c) => FavoriteJobService(c<Dio>()));
    container.registerFactory(
        (c) => FavoriteListBloc(c<FavoriteJobServiceInterface>()));
  }

  @override
  void _configureShared() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => GlobalMessageService());
    container.registerSingleton((c) => CustomNavigator());
    container.registerSingleton((c) => AnalyticsService());
  }
}
