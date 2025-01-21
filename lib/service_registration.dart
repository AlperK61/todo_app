import 'package:get_it/get_it.dart';
import 'package:todo_app/interfaces/authentication_interface.dart';
import 'package:todo_app/services/firebase_auth_service.dart';

final getIt = GetIt.instance;

Future init() async {
  // Register the AuthenticationService
  getIt.registerSingleton<AuthenticationInterface>(FirebaseAuthService());
}
