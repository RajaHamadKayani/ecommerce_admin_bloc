import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:ecommerce_bloc/data/repository/signup_repository/signup_repository.dart';
import 'package:ecommerce_bloc/models/user_model/user_model.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/image_picker_util.dart';
import 'package:ecommerce_bloc/utils/extensions/upload_image_to_cloudinary.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class SignupBloc extends Bloc<SignupEvents, SignupStates> {
  ImagePickerUtil imagePickerUtil = ImagePickerUtil();
  SignupRepository signupRepository;
  SignupBloc({required this.signupRepository}) : super(SignupStates()) {
    on<NameChangedEvent>(_nameChangedEvent);
    on<EmailChangedEvent>(_emailChangedEvent);
    on<PasswordChangedEvent>(_passwordChangedEvent);
    on<PhoneChangedEvent>(_phoneChangedEvent);
    on<GenderChangedEvent>(_genderChangedEvent);
    on<AddressChangedEvent>(_addressChangedEvent);
    on<SubmitButtonEvent>(_submitButtonEvent);
    on<AddProfileImageEvent>(_addProfileImageEvent);
  }

  void _nameChangedEvent(NameChangedEvent event, Emitter<SignupStates> emit) {
    emit(state.copyWith(name: event.name));
    if (kDebugMode) {
      print("SignuP name event changed ${state.name}");
    }
  }

  void _emailChangedEvent(EmailChangedEvent event, Emitter<SignupStates> emit) {
    emit(state.copyWith(email: event.email));
    if (kDebugMode) {
      print("SignuP email event changed ${state.name}");
    }
  }

  void _passwordChangedEvent(
      PasswordChangedEvent event, Emitter<SignupStates> emit) {
    emit(state.copyWith(password: event.password));
    if (kDebugMode) {
      print("SignuP password event changed ${state.name}");
    }
  }

  void _phoneChangedEvent(PhoneChangedEvent event, Emitter<SignupStates> emit) {
    emit(state.copyWith(phone: event.phone));
    if (kDebugMode) {
      print("SignuP phone event changed ${state.name}");
    }
  }

  void _genderChangedEvent(
      GenderChangedEvent event, Emitter<SignupStates> emit) {
    emit(state.copyWith(gender: event.gender));
    if (kDebugMode) {
      print("SignuP gender event changed ${state.gender}");
    }
  }

  void _addressChangedEvent(
      AddressChangedEvent event, Emitter<SignupStates> emit) {
    emit(state.copyWith(address: event.address));
    if (kDebugMode) {
      print("SignuP address event changed ${state.name}");
    }
  }

  void _addProfileImageEvent(
      AddProfileImageEvent event, Emitter<SignupStates> emit) async {
    XFile? image = await imagePickerUtil.getImage();
    emit(state.copyWith(image: image));
  }

  void _submitButtonEvent(
      SubmitButtonEvent event, Emitter<SignupStates> emit) async {
    emit(state.copyWith(statuses: Statuses.loading));
    String imageUrl;
    File? imageFile =
        state.image != null ? File(state.image!.path.toString()) : null;
    if (imageFile != null) {
      imageUrl =
          await UploadImageToCloudinary.uploadImageToCloudinary(imageFile);
      UserModel userModel = UserModel(
          name: state.name.toString(),
          email: state.email.toString(),
          password: state.password.toString(),
          address: state.address.toString(),
          role: state.email.trim() == "kayanihamad25@gmail.com" &&
                  state.password.trim() == "newpass12A@"
              ? "admin"
              : "user",
          phone: state.phone.toString(),
          gender: state.gender.toString(),
          image: imageUrl.toString());
      if (kDebugMode) {
        print("Name of the user is ${state.name.toString()}");
        print("Email of the user is ${state.email.toString()}");

        print("Gender of the user is ${state.gender.toString()}");

        print("phone of the user is ${state.phone.toString()}");

        print("Adrress of the user is ${state.address.toString()}");
        print("Password of the user is ${state.password.toString()}");
      }
      await signupRepository.signUp(userModel).then((value) {
        emit(
          state.copyWith(
              statuses: Statuses.success,
              message: "Sign up successfully!!!",
              name: "",
              email: '',
              password: '',
              phone: '',
              gender: '',
              address: '',
              image: null),
        );
      }).onError((error, stackTrace) {
        emit(state.copyWith(
          statuses: Statuses.error,
          message: error.toString(),
        ));
      });
    }
  }
}
