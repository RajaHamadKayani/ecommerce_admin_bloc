import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignupNAMEiNPUTwIDGET extends StatefulWidget {
  TextEditingController controller;
  FocusNode focusNode;

  SignupNAMEiNPUTwIDGET({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<SignupNAMEiNPUTwIDGET> createState() => _SignupNAMEiNPUTwIDGETState();
}

class _SignupNAMEiNPUTwIDGETState extends State<SignupNAMEiNPUTwIDGET> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return TextFormField(
            controller: widget.controller,
            style: GoogleFonts.poppins(),
            onFieldSubmitted: (vallue) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the name";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              context
                  .read<SignupBloc>()
                  .add(NameChangedEvent(name: value.toString()));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter name",
                hintStyle: GoogleFonts.poppins()),
          );
        });
  }
}
