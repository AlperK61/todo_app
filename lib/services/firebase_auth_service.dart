import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/interfaces/authentication_interface.dart';

class FirebaseAuthService implements AuthenticationInterface {
  @override
  Future<bool> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> register(
      String email, String emailVerificaton, String password) async {
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
