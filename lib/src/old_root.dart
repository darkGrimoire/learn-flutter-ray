import 'package:flutter/material.dart';
import 'package:test_fvm/src/old_navigation_bar.dart';
import 'package:test_fvm/src/screens/login.dart';
import 'package:test_fvm/src/services/auth.dart';
import 'package:test_fvm/src/widgets/globals/loading_indicator.dart';

// Root is a wrapper class to check whether the entry point for the user
// is the login page, home page, etc.
class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  // This auth system mimics Firebase Auth, which will return stream of User data
  // so we need to have some state management for checking if the user
  // data is exist or not.
  AuthStatus _authStatus = AuthStatus.notDetermined;

  void checkAuthStatus(String user) {
    if (user == "") {
      setState(() => _authStatus = AuthStatus.notLoggedIn);
    } else {
      setState(() => _authStatus = AuthStatus.loggedIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ? Note: Will changes after we use state management to handle Stream data.

    switch (_authStatus) {
      // AuthStatus.notDetermined will be executed when the Root is built first time.
      // It will listen to the stream and check for the auth status.
      case AuthStatus.notDetermined:
        Auth.getAuthStream().listen(checkAuthStatus);
        break;

      // AuthStatus.notLoggedIn will be executed if the user is not logged in.
      // Redirect to the login page.
      case AuthStatus.notLoggedIn:
        return const LoginPage();

      // AuthStatus.loggedIn will be executed if the user is logged in.
      // Redirect to the homepage of the application.
      case AuthStatus.loggedIn:
        return const OldNavigationBar();
    }

    return Scaffold(body: loadingIndicator(true));
  }
}
