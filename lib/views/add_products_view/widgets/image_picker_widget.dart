import 'dart:io';

import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductBloc, AddProductStates>(
      builder: (context, state) {
        if (state.image == null) {
          return GestureDetector(
            onTap: () {
              context.read<AddProductBloc>().add(ProductImageChangedEvent());
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black, width: 1)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Pick Image",
                      style: GoogleFonts.poppins(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 1),
    ),
    child: ClipOval(
      child: Image.file(
        File(state.image!.path.toString()),
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
    ),
  );
}

      },
    );
  }
}
