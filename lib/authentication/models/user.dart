import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:keejob_mobile/authentication/services/services.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String access;
  final String refresh;
  final DateTime expiryDate;
  final DateTime refreshExpiryDate;
  final bool needSignupCompletion;

  User({
    required this.id,
    required this.email,
    required this.access,
    required this.refresh,
    required this.expiryDate,
    required this.refreshExpiryDate,
    this.needSignupCompletion = false,
  });

  @override
  List<Object> get props => [
        id,
        email,
        access,
        refresh,
        expiryDate,
        refreshExpiryDate,
        needSignupCompletion,
      ];

  static Future<User?> loadFromSharedPreferences() async {
    final AuthenticationService authenticationService =
        Injector.resolve<AuthenticationService>();
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return null;
    }
    final userData = prefs.getString('userData');
    if (userData == null) {
      return null;
    }
    final extractedUserData = Map<String, dynamic>.from(json.decode(userData));
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'] as String);
    final refreshExpiryDate =
        DateTime.parse(extractedUserData['refreshExpiryDate'] as String);

    final user = User(
      access: extractedUserData['token'],
      id: extractedUserData['userId'] as int,
      email: extractedUserData['email'],
      refresh: extractedUserData['refresh'],
      expiryDate: expiryDate,
      refreshExpiryDate: refreshExpiryDate,
    );

    if (expiryDate.isBefore(DateTime.now())) {
      if (refreshExpiryDate.isAfter(DateTime.now())) {
        return await authenticationService.refreshToken(user);
      } else {
        return null;
      }
    }

    return user;
  }
}
