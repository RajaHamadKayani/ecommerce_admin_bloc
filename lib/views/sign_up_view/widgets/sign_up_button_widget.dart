import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_states.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/flushbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignUpButtonWidget extends StatefulWidget {
  GlobalKey<FormState> globalKey;
  // final VoidCallback onPress;
  final double height;
  final String buttonText;
  final double widget;
  final int buttonColor;
  final BorderRadius borderRadius;
  final TextEditingController nameController;
  final TextEditingController email;
  final TextEditingController address;
  final TextEditingController phone;
  final TextEditingController password;
  // final XFile image;

  SignUpButtonWidget(
      {super.key,
      // required this.onPress,
      required this.globalKey,
      required this.borderRadius,
      required this.buttonText,
      required this.buttonColor,
      // required this.image,
      required this.height,
      required this.widget,
      required this.nameController,
      required this.phone,
      required this.email,
      required this.password,
      required this.address});

  @override
  State<SignUpButtonWidget> createState() => _SignUpButtonWidgetState();
}

class _SignUpButtonWidgetState extends State<SignUpButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupStates>(
      listenWhen: (previous, current) => previous.statuses != current.statuses,
      listener: (context, state) {
        if (state.statuses == Statuses.loading) {
          FlushbarHelper.loadingFlushBar("Submitting...", context);
        }
        if (state.statuses == Statuses.error) {
          FlushbarHelper.errorMessageFlushBar(
              state.message.toString(), context);
        }
        if (state.statuses == Statuses.success) {
          widget.email.clear();
          widget.phone.clear();
          widget.password.clear();
          widget.nameController.clear();
          widget.address.clear();
          state.image == null;
          Navigator.pushNamed(context, RouteNames.signinViewRoute);
          if (kDebugMode) {
            print("Post Api successful");
          }
          FlushbarHelper.successMessageFlushBar(
              state.message.toString(), context);
        }
      },
      child: BlocBuilder<SignupBloc, SignupStates>(
          buildWhen: (previous, current) =>
              previous.statuses != current.statuses,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (widget.globalKey.currentState?.validate() ?? false) {
                  context.read<SignupBloc>().add(SubmitButtonEvent());
                  if (kDebugMode) {
                    print("Hemlo g");
                  }
                }
              },
              child: Container(
                height: widget.height,
                width: widget.widget,
                decoration: BoxDecoration(
                  color: Color(widget.buttonColor),
                  borderRadius: widget.borderRadius,
                ),
                child: Center(
                  child: state.statuses == Statuses.loading
                      ? CircularProgressIndicator()
                      : Text(
                          widget.buttonText,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                ),
              ),
            );
          }),
    );
  }
}
