import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class SignupStates extends Equatable {
  String email;
  String name;
  String password;
  String gender;
  String phone;
  String address;
  Statuses statuses;
  String message;
  XFile? image;

  SignupStates(
      {this.address = '',
      this.email = '',
      this.message = '',
      this.image,
      this.gender = '',
      this.name = '',
      this.password = '',
      this.phone = '',
      this.statuses = Statuses.initial});

  SignupStates copyWith(
      {String? email,
      String? name,
      String? password,
      String? gender,
      String? message,
      XFile? image,
      String? phone,
      String? address,
      Statuses? statuses}) {
    return SignupStates(
        email: email ?? this.email,
        image: image ?? this.image,
        name: name ?? this.name,
        message: message ?? this.message,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        statuses: statuses ?? this.statuses);
  }

  @override
  List<Object?> get props => [
        phone,
        address,
        password,
        address,
        name,
        email,
        statuses,
        message,
        image
      ];
}
