import 'package:equatable/equatable.dart';

class SignupEvents extends Equatable {
  const SignupEvents();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class NameChangedEvent extends SignupEvents {
  String name;
  NameChangedEvent({required this.name});
  @override
  List<Object?> get props => [name];
}

// ignore: must_be_immutable
class EmailChangedEvent extends SignupEvents {
  String email;
  EmailChangedEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

// ignore: must_be_immutable
class PasswordChangedEvent extends SignupEvents {
  String password;
  PasswordChangedEvent({required this.password});
  @override
  List<Object?> get props => [password];
}

// ignore: must_be_immutable
class PhoneChangedEvent extends SignupEvents {
  String phone;
  PhoneChangedEvent({required this.phone});
  @override
  List<Object?> get props => [phone];
}

// ignore: must_be_immutable
class GenderChangedEvent extends SignupEvents {
  String gender;
  GenderChangedEvent({required this.gender});
  @override
  List<Object?> get props => [gender];
}

// ignore: must_be_immutable
class AddressChangedEvent extends SignupEvents {
  String address;
  AddressChangedEvent({required this.address});
  @override
  List<Object?> get props => [address];
}

class SubmitButtonEvent extends SignupEvents {
  
}

class AddProfileImageEvent extends SignupEvents {}
