import 'package:ecommerce_bloc/data/repository/sign_in_repository/signin_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninFirebaseAuthenticationRepository implements SigninRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> signInUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
