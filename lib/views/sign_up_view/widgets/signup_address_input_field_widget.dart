import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignupAddressInputFieldWidget extends StatefulWidget {
  TextEditingController controller;
  FocusNode focusNode;

  SignupAddressInputFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  State<SignupAddressInputFieldWidget> createState() =>
      _SignupAddressInputFieldWidgetState();
}

class _SignupAddressInputFieldWidgetState extends State<SignupAddressInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
        buildWhen: (previous, current) => previous.address != current.address,
        builder: (context, state) {
          return TextFormField(
            controller: widget.controller,
            style: GoogleFonts.poppins(),
            onFieldSubmitted: (vallue) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the address";
              } else {
                return null;
              }
            },
            onChanged: (value) {
              context
                  .read<SignupBloc>()
                  .add(AddressChangedEvent(address: value.toString()));
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter address",
                hintStyle: GoogleFonts.poppins()),
          );
        });
  }
}
