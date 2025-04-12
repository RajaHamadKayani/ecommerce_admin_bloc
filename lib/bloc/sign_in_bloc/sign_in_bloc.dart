import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_events.dart';
import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_states.dart';
import 'package:ecommerce_bloc/data/repository/sign_in_repository/signin_repository.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInStates> {
  SigninRepository signinRepository;
  SignInBloc({required this.signinRepository}) : super(SignInStates()) {
    on<SignInEmailChangedEvent>(_emailChangedEvent);
    on<SignInPasswordChangedEvent>(_passwordChangedEvent);
    on<SubmitSignInEventButton>(_submitButtonEvent);
  }

  void _emailChangedEvent(
      SignInEmailChangedEvent event, Emitter<SignInStates> emit) {
    emit(state.copyWith(email: event.email.toString()));
  }

  void _passwordChangedEvent(
      SignInPasswordChangedEvent event, Emitter<SignInStates> emit) {
    emit(state.copyWith(password: event.password.toString()));
  }

  void _submitButtonEvent(
      SubmitSignInEventButton event, Emitter<SignInStates> emit) async {
    emit(state.copyWith(statuses: Statuses.loading));
    String email = state.email.toString();
    String password = state.password.toString();
    await signinRepository.signInUser(email, password).then((value) {
      emit(state.copyWith(
          statuses: Statuses.success, message: "Login Successfully!!!"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(message: error.toString(), statuses: Statuses.error));
    });
  }
}
