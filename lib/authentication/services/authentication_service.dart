import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:keejob_mobile/config/app_config.dart';
import '../utils/jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/exceptions.dart';
import '../models/models.dart';

abstract class AuthenticationService {
  Future<User?> getCurrentUser();

  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User> signInWithSocial(String backend, String accessToken);

  Future<void> signOut();

  Future<User> refreshToken(User user);
}

class ApiAuthenticationService extends AuthenticationService {
  final Dio dio;

  ApiAuthenticationService(this.dio);

  @override
  Future<User?> getCurrentUser() async {
    return User.loadFromSharedPreferences();
  }

  @override
  Future<User> refreshToken(User user) async {
    final url = AppConfig.AUTH_TOKEN_REFRESH;
    try {
      final response = await dio.post(
        url,
        data: json.encode(
          {
            'refresh': user.refresh,
          },
        ),
      );
      final responseData = response.data;
      if (responseData['detail'] != null) {
        throw AuthenticationException(message: responseData['detail']);
      }
      final parsedToken = parseJwt(responseData['access']);
      final newUser = User(
        access: responseData['access'],
        id: responseData['user_id'] ?? 0,
        email: user.email,
        refresh: user.refresh,
        expiryDate: DateTime.fromMillisecondsSinceEpoch(
            parsedToken['exp'] * 1000,
            isUtc: true),
        refreshExpiryDate: user.refreshExpiryDate,
      );
      // _autoLogout();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': newUser.access,
          'email': newUser.email,
          'userId': newUser.id,
          'expiryDate': newUser.expiryDate.toIso8601String(),
          'refresh': newUser.refresh,
          'refreshExpiryDate': newUser.refreshExpiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
      return newUser;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final url = AppConfig.AUTH_SIGN_IN;
    try {
      final response = await dio.post(
        url,
        data: json.encode(
          {
            'username': email,
            'password': password,
          },
        ),
      );
      final responseData = response.data;
      if (responseData['detail'] != null) {
        throw AuthenticationException(message: responseData['detail']);
      }
      final parsedToken = parseJwt(responseData['access']);
      final parsedRefesh = parseJwt(responseData['refresh']);
      final user = User(
        access: responseData['access'],
        id: responseData['user_id'] ?? 0,
        email: email,
        refresh: responseData['refresh'],
        expiryDate: DateTime.fromMillisecondsSinceEpoch(
            parsedToken['exp'] * 1000,
            isUtc: true),
        refreshExpiryDate: DateTime.fromMillisecondsSinceEpoch(
            parsedRefesh['exp'] * 1000,
            isUtc: true),
      );
      // _autoLogout();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': user.access,
          'email': user.email,
          'userId': user.id,
          'expiryDate': user.expiryDate.toIso8601String(),
          'refresh': user.refresh,
          'refreshExpiryDate': user.refreshExpiryDate.toIso8601String(),
        },
      );

      prefs.setString('userData', userData);
      return user;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  @override
  Future<User> signInWithSocial(String backend, String accessToken) async {
    final url = AppConfig.AUTH_SIGN_IN_SOCIAL.replaceFirst('BACKEND', backend);
    try {
      final response = await dio.get(
        url,
        queryParameters: {'access_token': accessToken},
      );
      final responseData = response.data;
      if (responseData.containsKey('error')) {
        throw AuthenticationException(message: responseData['error']);
      }
      final parsedToken = parseJwt(responseData['access']);
      final parsedRefesh = parseJwt(responseData['refresh']);
      final user = User(
        access: responseData['access'],
        id: responseData['user_id'] ?? 0,
        email: responseData['email'],
        refresh: responseData['refresh'],
        expiryDate: DateTime.fromMillisecondsSinceEpoch(
            parsedToken['exp'] * 1000,
            isUtc: true),
        refreshExpiryDate: DateTime.fromMillisecondsSinceEpoch(
            parsedRefesh['exp'] * 1000,
            isUtc: true),
        needSignupCompletion: responseData['need_signup_completion'],
      );
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': user.access,
          'email': user.email,
          'userId': user.id,
          'expiryDate': user.expiryDate.toIso8601String(),
          'refresh': user.refresh,
          'refreshExpiryDate': user.refreshExpiryDate.toIso8601String(),
        },
      );

      prefs.setString('userData', userData);
      return user;
    } catch (error) {
      rethrow;
    }
  }
}
