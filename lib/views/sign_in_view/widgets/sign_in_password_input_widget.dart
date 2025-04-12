import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_events.dart';
import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignInPasswordInputWidget extends StatefulWidget {
  TextEditingController controller;
  FocusNode focusNode;

  SignInPasswordInputWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<SignInPasswordInputWidget> createState() =>
      _SignInPasswordInputWidgetState();
}

class _SignInPasswordInputWidgetState extends State<SignInPasswordInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInStates>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
            controller: widget.controller,
            style: GoogleFonts.poppins(),
            onFieldSubmitted: (vallue) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the email";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              context
                  .read<SignInBloc>()
                  .add(SignInPasswordChangedEvent(password: value.toString()));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Email",
                hintStyle: GoogleFonts.poppins()),
          );
        });
  }
}
