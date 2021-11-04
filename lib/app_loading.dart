import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/job_types_bloc/job_types_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/job_types_bloc/job_types_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/profession_bloc/search_profession_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/profession_bloc/search_profession_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_event.dart';
import 'package:keejob_mobile/signup/bloc/country_list_bloc.dart';
import 'package:keejob_mobile/signup/bloc/country_list_event.dart';
import 'package:keejob_mobile/signup/service/signup-source-service.dart';

loadFilters() {
  Injector.resolve<SearchProfessionListBloc>()..add(GetSearchProfessionList());
  Injector.resolve<SearchEducationLevelBloc>()..add(GetEducationLevelList());
  Injector.resolve<SearchExperienceLevelBloc>()..add(GetExperienceLevelList());
  Injector.resolve<SearchJobTypesBloc>()..add(GetJobTypesList());
  Injector.resolve<SearchLocalityBloc>()..add(GetLocalityList());
  Injector.resolve<SignUpSourceServiceInterface>();
  Injector.resolve<CountryListBloc>()..add(GetCountryList());
}
