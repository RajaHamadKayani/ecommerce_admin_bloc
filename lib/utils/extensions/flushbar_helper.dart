import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushbarHelper {
  static errorMessageFlushBar(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message.toString(),
          forwardAnimationCurve: Curves.decelerate,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin: EdgeInsets.all(10),
          flushbarPosition: FlushbarPosition.TOP,
          duration: Duration(seconds: 4),
          icon: Icon(Icons.error),
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
        )..show(context));
  }

  static void successMessageFlushBar(
      String successMessage, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: successMessage,
          forwardAnimationCurve: Curves.decelerate,
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.all(10),
          icon:Icon(Icons.done),
          backgroundColor: Colors.green,
          duration: Duration(
            seconds: 3
          ),
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        )..show(context));
  }
    static void loadingFlushBar(
      String successMessage, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: successMessage,
          forwardAnimationCurve: Curves.decelerate,
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.all(10),
          icon:Icon(Icons.sync),
          backgroundColor: Colors.yellow,

          duration: Duration(
            seconds: 3
          ),
          borderRadius: BorderRadius.circular(10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        )..show(context));
  }
}
