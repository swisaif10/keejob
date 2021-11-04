import 'package:flutter/foundation.dart' as Foundation;
import 'package:intl/intl.dart';

class AppConfig {
  static final SENTRY_DSN =
      'https://6dd99830988145f18cb857754fb9ed0f@sentry.keejob.com/3';

  static final DATE_FORMAT = DateFormat('yyyy-MM-dd');
  static final DISPLAY_DATE_FORMAT = DateFormat('dd/MM/yy');

  static final BACKEND_URL = 'https://www.keejob.com';

  static final DEFAULT_RECRUITER_IMG =
      '$BACKEND_URL/static/final/images/default-logo-01.jpg';

  static final IS_RELEASE_MODE = Foundation.kReleaseMode;
  static final IS_DEBUG_MODE = Foundation.kDebugMode;
  static final API_URL = '$BACKEND_URL/api/v2';

  static final API_TOKEN = '11bc17056d7ee062f4d1817ba8dcac21dde52acf';
  static final AUTH_TOKEN_REFRESH = '$API_URL/token/refresh/';
  static final AUTH_SIGN_IN = '$API_URL/token/';
  static final AUTH_SIGN_IN_SOCIAL = '$API_URL/social/login/BACKEND/';
  static final AUTH_SIGNIN_SOCIAL_COMPLETE =
      '$API_URL/jobseekers/signup-social/';
  static final JOBS_LIST = '$API_URL/jobs/';
  static final RECRUITER_LIST = '$API_URL/recruiters/';
  static final EDUCATION_LEVEL_LIST = '$API_URL/education-levels/';
  static final EXPERIENCE_LEVEL_LIST = '$API_URL/experience-levels/';
  static final JOB_TYPE_LIST = '$API_URL/job-types/';
  static final LOCALITY_LIST = '$API_URL/tunisia-regions/';
  static final PROFESSION_LIST = '$API_URL/professions/';
  static final DOMAIN_LIST = '$API_URL/training-domains/';
  static final TRAININGS_LIST = '$API_URL/trainings/';
  static final COUNTRY_LIST = '$API_URL/countries/';
  static final JOBSEEKER_PROFILE = '$API_URL/jobseekers/profile/';
  static final SIGN_UP = '$API_URL/jobseekers/signup/';
  static final APPLICATION = '$API_URL/jobseekers/applications/';
  static final DOCUMENT = '$API_URL/jobseekers/documents/';
  static final COVER_LETTER = '$API_URL/jobseekers/cover-letters/';
  static final FAVORITE_JOB = '$API_URL/jobseekers/favorite-jobs/';
  static final CONTACT_CENTER = '$API_URL/jobseekers/contact-training-center/';
  static final RESET_PASSWORD = '$API_URL/jobseekers/password-reset/';

  static job_details(int jobId) => '$JOBS_LIST$jobId/';
  static recruiter_details(int recruiterId) => '$RECRUITER_LIST$recruiterId/';
  static training_details(int trainingId) => '$TRAININGS_LIST$trainingId/';
}
