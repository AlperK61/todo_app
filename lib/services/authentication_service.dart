import 'package:todo_app/interfaces/authentication_interface.dart';

class AuthenticationService extends AuthenticationInterface {
  //Login function
  @override
  Future<bool> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  //Register function
  @override
  Future<bool> register(
      String email, String emailVerificaton, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
