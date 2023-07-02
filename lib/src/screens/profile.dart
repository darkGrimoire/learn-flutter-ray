import 'package:flutter/material.dart';
import 'package:test_fvm/src/services/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String username = Auth.getUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: Center(
        child: Text(
          username,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
