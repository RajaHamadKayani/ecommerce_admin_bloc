import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalTextWidget extends StatefulWidget {
  final String text;
  const NormalTextWidget({super.key, required this.text});

  @override
  State<NormalTextWidget> createState() => _NormalTextWidgetState();
}

class _NormalTextWidgetState extends State<NormalTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.poppins(
          color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
    );
  }
}
