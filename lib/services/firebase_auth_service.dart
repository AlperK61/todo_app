import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/interfaces/authentication_interface.dart';

class FirebaseAuthService implements AuthenticationInterface {
  @override
  Future<bool> logIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      print("Email and password cannot be empty");
      return false;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        print("User logged in: ${userCredential.user?.email}");
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
      return false;
    } catch (e) {
      print("Unexpected error: $e");
      return false;
    }
  }

  @override
  Future<bool> register(
      String email, String emailVerificaton, String password) async {
    if (email != emailVerificaton) {
      return false;
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
