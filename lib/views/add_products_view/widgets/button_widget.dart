import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/flushbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
  GlobalKey<FormState> globalKey;
  final VoidCallback onPress;
  final double height;
  final String buttonText;
  final double widget;
  final int buttonColor;
  final BorderRadius borderRadius;
  ButtonWidget(
      {super.key,
      required this.onPress,
      required this.globalKey,
      required this.borderRadius,
      required this.buttonText,
      required this.buttonColor,
      required this.height,
      required this.widget});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductBloc, AddProductStates>(
      listener: (context, state) {
        if (state.statuses == Statuses.loading) {
          FlushbarHelper.loadingFlushBar("Submitting...", context);
        }
        if (state.statuses == Statuses.error) {
          FlushbarHelper.errorMessageFlushBar(
              state.message.toString(), context);
        }
        if (state.statuses == Statuses.success) {
          if (kDebugMode) {
            print("Post Api successful");
          }
          FlushbarHelper.successMessageFlushBar(
              state.message.toString(), context);
        }
      },
      child: BlocBuilder<AddProductBloc, AddProductStates>(
          builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (widget.globalKey.currentState?.validate() ?? false) {
              widget.onPress();
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
