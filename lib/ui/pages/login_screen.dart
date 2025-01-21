import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/interfaces/authentication_interface.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final getIt = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Username
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
            ),

            //Passwort:
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder()),
              ),
            ),

            //Login button
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
              onPressed: () async {
                if (_usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "Username and password cannot be empty.",
                    ),
                  );
                  return;
                }

                try {
                  bool loggedIn = await getIt<AuthenticationInterface>().logIn(
                      _usernameController.text, _passwordController.text);

                  if (loggedIn) {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(
                        message: "Successfully logged in",
                      ),
                    );
                  } else {
                    print(
                        'Login failed with credentials: ${_usernameController.text} / ${_passwordController.text}');
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: "Login failed",
                      ),
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  print('FirebaseAuthException: ${e.message}');
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "Login error: ${e.message}",
                    ),
                  );
                } catch (e, stacktrace) {
                  print('Unexpected error: $e');
                  print('Stacktrace: $stacktrace');
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: "An unexpected error occurred.",
                    ),
                  );
                }
              },
              child: Text('Log in'),
            ),

            SizedBox(
              height: 20,
            ),

            //Register button
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () async {
                  await getIt<AuthenticationInterface>().register(
                      _usernameController.text,
                      _usernameController.text,
                      _passwordController.text);
                  print(_usernameController.text);
                  print(_passwordController.text);
                },
                child: Text('Register'))
          ],
        ),
      ),
    );
  }
}
