import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignupPhoneInputFieldWidget extends StatefulWidget {
  TextEditingController controller;
  FocusNode focusNode;

  SignupPhoneInputFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<SignupPhoneInputFieldWidget> createState() =>
      _SignupPhoneInputFieldWidgetState();
}

class _SignupPhoneInputFieldWidgetState
    extends State<SignupPhoneInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          return TextFormField(
            controller: widget.controller,
            style: GoogleFonts.poppins(),
            onFieldSubmitted: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the phone";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              context
                  .read<SignupBloc>()
                  .add(PhoneChangedEvent(phone: value.toString()));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter phone",
                hintStyle: GoogleFonts.poppins()),
          );
        });
  }
}
