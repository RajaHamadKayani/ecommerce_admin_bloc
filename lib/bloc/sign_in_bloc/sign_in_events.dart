import 'package:equatable/equatable.dart';

class SignInEvents extends Equatable {
  const SignInEvents();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SignInEmailChangedEvent extends SignInEvents {
  String email;
  SignInEmailChangedEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

// ignore: must_be_immutable
class SignInPasswordChangedEvent extends SignInEvents {
  String password;
  SignInPasswordChangedEvent({required this.password});
  @override
  List<Object?> get props => [password];
}

class SubmitSignInEventButton extends SignInEvents {}
