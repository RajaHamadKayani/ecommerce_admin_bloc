import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: must_be_immutable
class PriceInputWidget extends StatefulWidget {
    FocusNode focusNode;
var controller;
   PriceInputWidget({super.key,required this.focusNode,required this.controller});

  @override
  State<PriceInputWidget> createState() => _PriceInputWidgetState();
}

class _PriceInputWidgetState extends State<PriceInputWidget> {
 @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
            buildWhen: (previous, current) => previous.productPrice!=current.productPrice,

      builder: (context, state) {
         if(kDebugMode){
          print("rebuilding price widget");
        }
        return TextFormField(
          controller: widget.controller,
          validator: (value){
            if(value!.isEmpty){
              return "Enter Product Price";
            }
            else{
              return null;
            }
          },
          style: GoogleFonts.poppins(),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Price",
            hintStyle: GoogleFonts.poppins(),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {
            context
                .read<AddProductBloc>()
                .add(ProductPriceChangedEvent(productPrice: value));
          },
          focusNode: widget.focusNode,
        );
      },
    );
  }
}