abstract class SigninRepository {
  Future<void> signInUser(String email, String password);
}