import 'dart:io';

import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_events.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateImagePickerWidget extends StatefulWidget {
  String currentImageUrl;
  String id;
  UpdateImagePickerWidget(
      {super.key, required this.currentImageUrl, required this.id});

  @override
  State<UpdateImagePickerWidget> createState() =>
      _UpdateImagePickerWidgetState();
}

class _UpdateImagePickerWidgetState extends State<UpdateImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProductBloc, UpdateProductStates>(
      builder: (context, state) {
        if (state.image == null) {
          return GestureDetector(
            onTap: () {
              context.read<UpdateProductBloc>().add(
                    UpdateImageEvent(
                      id: widget.id,
                      imageUrl: widget.currentImageUrl,
                    ),
                  );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black, width: 1)),
              child: ClipOval(
                child: Image.network(
                  widget.currentImageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
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
