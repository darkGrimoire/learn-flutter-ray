import 'package:flutter/material.dart';
import 'package:test_fvm/src/services/auth.dart';
import 'package:test_fvm/src/widgets/globals/loading_indicator.dart';

// Old Login Page simulates logging screen which will change
// the Auth._user and then trigger the root/router redirect to
// the main application.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  bool isLoading = false;

  Future onLoginClick() async {
    // TODO: Make isLoading global using state management
    setState(() => isLoading = true);

    _formKey.currentState!.save();

    if (_formKey.currentState!.validate()) {
      await Auth.login(username);
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),

      // Using form for input validations
      body: Form(
        key: _formKey,

        // Using stack for loading indicator
        child: Stack(
          children: [
            // Main login page widgets.
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "Username",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                      fillColor: const Color(0xFFC4C4C4),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      if (value.length > 10) {
                        return 'Username tidak boleh lebih dari 15 huruf';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() => username = value!),
                  ),
                  const SizedBox(height: 14.0),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF3282B8),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 30),
                      ),
                    ),
                    onPressed: () async => await onLoginClick(),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Loading widget helper which later can be defined in Root for reusability
            loadingIndicator(isLoading)
          ],
        ),
      ),
    );
  }
}
