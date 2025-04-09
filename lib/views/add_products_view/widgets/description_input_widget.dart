import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart'; // ✅ Add this!
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DescriptionInputWidget extends StatefulWidget {
  FocusNode focusNode;
  var controller;

  DescriptionInputWidget({super.key, required this.focusNode,required this.controller});

  @override
  State<DescriptionInputWidget> createState() => _DescriptionInputWidgetState();
}

class _DescriptionInputWidgetState extends State<DescriptionInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
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
            hintText: "Enter Description",
            hintStyle: GoogleFonts.poppins(),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {
            context
                .read<AddProductBloc>()
                .add(ProductDescriptionChangedEvent(productDescription: value));
          },
          focusNode: widget.focusNode,
        );
      },
    );
  }
}
