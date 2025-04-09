import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NameInputWidget extends StatefulWidget {
  FocusNode focusNode;
  var controller;

  NameInputWidget({super.key, required this.focusNode,required this.controller});

  @override
  State<NameInputWidget> createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
            buildWhen: (previous, current) => previous.productName!=current.productName,

      builder: (context, state) {
        if(kDebugMode){
          print("rebuilding name widget");
        }
        return TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Product Name";
            } else {
              return null;
            }
          },
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Name",
            hintStyle: GoogleFonts.poppins(),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {
            context
                .read<AddProductBloc>()
                .add(ProductNameChangedEvent(productName: value));
          },
          focusNode: widget.focusNode,
        );
      },
    );
  }
}
