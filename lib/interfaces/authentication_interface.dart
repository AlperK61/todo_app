abstract class AuthenticationInterface {
  Future<bool> logIn(String email, String password);

  Future<bool> register(String email, String emailVerificaton, String password);

  // Future<void> signInWithEmailAndPassword(String email, String password);
  // Future<void> signUpWithEmailAndPassword(String email, String password);
  // Future<void> signOut();
  // Stream<User> get authStateChanges;
}
