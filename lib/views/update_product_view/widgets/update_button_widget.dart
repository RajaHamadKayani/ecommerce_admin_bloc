import 'dart:io';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_events.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_states.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  final double height;
  final String buttonText;
  final double widget;
  final int buttonColor;
  final String imageUrl;
  final String? currentName;
  final String? currentDescription;
  final String? currentQuantity;
  final String? currentPrice;
  final String id;
  final BorderRadius borderRadius;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController quantityController;

  const UpdateButtonWidget({
    super.key,
    required this.globalKey,
    required this.id,
    required this.borderRadius,
    required this.imageUrl,
    required this.currentDescription,
    required this.currentName,
    required this.currentPrice,
    required this.currentQuantity,
    required this.buttonText,
    required this.buttonColor,
    required this.height,
    required this.widget,
    required this.nameController,
    required this.descriptionController,
    required this.priceController,
    required this.quantityController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductBloc, UpdateProductStates>(
      listenWhen: (previous, current) => previous.statuses != current.statuses,
      listener: (context, state) {
        if (state.statuses == Statuses.loading) {
          FlushbarHelper.loadingFlushBar("Updating...", context);
        } else if (state.statuses == Statuses.error) {
          FlushbarHelper.errorMessageFlushBar(state.message ?? '', context);
        } else if (state.statuses == Statuses.success) {
          Navigator.pushNamed(context, RouteNames.allProductsViewRoute);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (globalKey.currentState!.validate()) {
              final updatedName = nameController.text.trim().isEmpty
                  ? currentName!
                  : nameController.text.trim();
              final updatedDescription = descriptionController.text.trim().isEmpty
                  ? currentDescription!
                  : descriptionController.text.trim();
              final updatedPrice = priceController.text.trim().isEmpty
                  ? currentPrice!
                  : priceController.text.trim();
              final updatedQuantity = quantityController.text.trim().isEmpty
                  ? currentQuantity!
                  : quantityController.text.trim();

              context.read<UpdateProductBloc>().add(
                    UpdateProductButtonPressedEvent(
                      productId: id,
                      name: updatedName,
                      description: updatedDescription,
                      price: updatedPrice,
                      quantity: updatedQuantity,
                      oldImageUrl: imageUrl,
                      newImageFile: File(state.image!.path),
                    ),
                  );
            }
          },
          child: Container(
            height: height,
            width: widget,
            decoration: BoxDecoration(
              color: Color(buttonColor),
              borderRadius: borderRadius,
            ),
            alignment: Alignment.center,
            child: Center(
                  child: state.statuses == Statuses.loading
                      ? CircularProgressIndicator()
                      : Text(
                          buttonText,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                ),
          ),
        );
      },
    );
  }
}


