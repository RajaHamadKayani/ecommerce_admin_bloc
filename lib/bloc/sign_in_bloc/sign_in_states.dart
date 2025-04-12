import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SignInStates extends Equatable {
  String email;
  String password;

  Statuses statuses;
  String message;

  SignInStates(
      {this.email = '',
      this.message = '',
      this.password = '',
      this.statuses = Statuses.initial});

  SignInStates copyWith(
      {String? email, String? password, String? message, Statuses? statuses}) {
    return SignInStates(
        email: email ?? this.email,
        message: message ?? this.message,
        password: password ?? this.password,
        statuses: statuses ?? this.statuses);
  }

  @override
  List<Object?> get props => [
        password,
        email,
        statuses,
        message,
      ];
}
