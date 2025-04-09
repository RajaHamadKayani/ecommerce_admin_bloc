import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class QuantityInputWidget extends StatefulWidget {
  FocusNode focusNode;
  var controller;
  QuantityInputWidget({super.key, required this.focusNode,
  required this.controller});

  @override
  State<QuantityInputWidget> createState() => _QuantityInputWidgetState();
}

class _QuantityInputWidgetState extends State<QuantityInputWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
          buildWhen: (previous, current) => previous.productQuantity!=current.productQuantity,

      builder: (context, state) {
         if(kDebugMode){
          print("rebuilding quantity widget");
        }
        return TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter Product Quantity";
            } else {
              return null;
            }
          },
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Quantity",
            hintStyle: GoogleFonts.poppins(),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {
            context
                .read<AddProductBloc>()
                .add(ProductQuantityChangedEvent(productQuantity: value));
          },
          focusNode: widget.focusNode,
        );
      },
    );
  }
}
