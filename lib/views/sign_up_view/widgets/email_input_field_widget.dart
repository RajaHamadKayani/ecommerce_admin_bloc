import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignUpEmailInputWidget extends StatefulWidget {
  TextEditingController controller;
  FocusNode focusNode;

  SignUpEmailInputWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<SignUpEmailInputWidget> createState() => _SignUpEmailInputWidgetState();
}

class _SignUpEmailInputWidgetState extends State<SignUpEmailInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
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
                  .read<SignupBloc>()
                  .add(EmailChangedEvent(email: value.toString()));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Email",
                hintStyle: GoogleFonts.poppins()),
          );
        });
  }
}
