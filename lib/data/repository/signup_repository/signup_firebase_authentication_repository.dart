import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/data/repository/signup_repository/signup_repository.dart';
import 'package:ecommerce_bloc/models/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupFirebaseAuthenticationRepository implements SignupRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<UserModel> signUp(UserModel user) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email.toString(), password: user.password.toString())
          .then((value) async {
        DocumentReference documentReference =
            firebaseFirestore.collection("users").doc();
        final updatedModel = user.copyWith(id: documentReference.id);
        final json = updatedModel.toJson();
        documentReference.set(json);
      }).onError((error, stackTrace) {
        throw Exception(error.toString());
      });
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
