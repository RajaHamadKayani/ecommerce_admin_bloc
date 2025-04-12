import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectGenderWidget extends StatefulWidget {
  const SelectGenderWidget({super.key});

  @override
  State<SelectGenderWidget> createState() => _SelectGenderWidgetState();
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  String? selectedGender;

  final List<String> genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupStates>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          value: state.gender.isNotEmpty ? state.gender : null,
          items: genderOptions
              .map((gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(
                      gender,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<SignupBloc>().add(
                    GenderChangedEvent(gender: value.toString()),
                  );
            }
          },
          decoration: InputDecoration(
            hintText: "Select gender",
            hintStyle: GoogleFonts.poppins(),
            border: OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        );
      },
    );
  }
}
