import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignupPasswordFieldWidget extends StatefulWidget {
  TextEditingController controller;
  FocusNode focusNode;

  SignupPasswordFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<SignupPasswordFieldWidget> createState() =>
      _SignupPasswordFieldWidgetState();
}

class _SignupPasswordFieldWidgetState extends State<SignupPasswordFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            controller: widget.controller,
            style: GoogleFonts.poppins(),
            onFieldSubmitted: (vallue) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the password";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              context
                  .read<SignupBloc>()
                  .add(PasswordChangedEvent(password: value.toString()));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter password",
                hintStyle: GoogleFonts.poppins()),
          );
        });
  }
}
