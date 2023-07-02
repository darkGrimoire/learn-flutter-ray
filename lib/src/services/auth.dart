import 'package:flutter/material.dart';

enum AuthStatus {
  notDetermined,
  notLoggedIn,
  loggedIn,
}

class Auth extends ChangeNotifier {
  // Empty user means user has been logged out.
  // Filled user means user is logged in.
  static String _user = "";

  static String get getUser {
    return _user;
  }

  // Simulating polling for user login information every 1 seconds
  // As a Stream (like Firebase)
  static Stream<String> getAuthStream() async* {
    while (true) {
      yield _user;
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  // Simulating user login waiting 1 seconds
  static Future<void> login(String user) async {
    await Future.delayed(const Duration(seconds: 1));
    _user = user;
  }

// Simulating user logout waiting 1 seconds
  static Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _user = "";
  }
}
