import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_events.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UpdateDescriptionInputWidget extends StatefulWidget {
  FocusNode focusNode;
  var controller;

  UpdateDescriptionInputWidget({super.key, required this.focusNode,required this.controller});

  @override
  State<UpdateDescriptionInputWidget> createState() => _UpdateDescriptionInputWidgetState();
}

class _UpdateDescriptionInputWidgetState extends State<UpdateDescriptionInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProductBloc, UpdateProductStates>(
      buildWhen: (previous, current) => previous.productDescription!=current.productDescription,
      builder: (context, state) {
         if(kDebugMode){
          print("rebuilding description widget");
        }
        return TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Enter Product Description";
            }
            return null;
          },
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Update Description",
            hintStyle: GoogleFonts.poppins(),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {
            context
                .read<UpdateProductBloc>()
                .add(UpdateDescriptionEvent(productDescription: value));
          },
          focusNode: widget.focusNode,
        );
      },
    );
  }
}
