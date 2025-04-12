import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_events.dart';
import 'package:ecommerce_bloc/bloc/sign_in_bloc/sign_in_states.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_bloc.dart';
import 'package:ecommerce_bloc/bloc/signup_bloc/signup_events.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/flushbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignInButtonWidget extends StatefulWidget {
  GlobalKey<FormState> globalKey;
  // final VoidCallback onPress;
  final double height;
  final String buttonText;
  final double widget;
  final int buttonColor;
  final BorderRadius borderRadius;
  final TextEditingController email;

  final TextEditingController password;
  // final XFile image;

  SignInButtonWidget({
    super.key,
    // required this.onPress,
    required this.globalKey,
    required this.borderRadius,
    required this.buttonText,
    required this.buttonColor,
    // required this.image,
    required this.height,
    required this.widget,
    required this.email,
    required this.password,
  });

  @override
  State<SignInButtonWidget> createState() => _SignInButtonWidgetState();
}

class _SignInButtonWidgetState extends State<SignInButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInStates>(
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

          widget.password.clear();

          Navigator.pushNamed(context, RouteNames.allProductsViewRoute);
          if (kDebugMode) {
            print("Post Api successful");
          }
          FlushbarHelper.successMessageFlushBar(
              state.message.toString(), context);
        }
      },
      child: BlocBuilder<SignInBloc, SignInStates>(
          buildWhen: (previous, current) =>
              previous.statuses != current.statuses,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (widget.globalKey.currentState?.validate() ?? false) {
                  context.read<SignInBloc>().add(SubmitSignInEventButton());
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
