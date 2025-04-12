import 'package:ecommerce_bloc/models/user_model/user_model.dart';

abstract class SignupRepository {
  Future<UserModel> signUp(UserModel user);
}