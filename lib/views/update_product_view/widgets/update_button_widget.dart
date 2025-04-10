import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_events.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_states.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/flushbar_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UpdateButtonWidget extends StatefulWidget {
  GlobalKey<FormState> globalKey;
  // final VoidCallback onPress;
  final double height;
  final String buttonText;
  final double widget;
  final int buttonColor;
  String id;
  final BorderRadius borderRadius;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController quantityController;

  UpdateButtonWidget({
    super.key,
    // required this.onPress,
    required this.globalKey,
    required this.id,
    required this.borderRadius,
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
  State<UpdateButtonWidget> createState() => _UpdateButtonWidgetState();
}

class _UpdateButtonWidgetState extends State<UpdateButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProductBloc, UpdateProductStates>(
      listenWhen: (previous, current) => previous.statuses != current.statuses,
      listener: (context, state) {
        if (state.statuses == Statuses.loading) {
          FlushbarHelper.loadingFlushBar("Submitting...", context);
        }
        if (state.statuses == Statuses.error) {
          FlushbarHelper.errorMessageFlushBar(
              state.message.toString(), context);
        }
        if (state.statuses == Statuses.success) {
          widget.descriptionController.clear();
          widget.priceController.clear();
          widget.quantityController.clear();
          widget.nameController.clear();
          Navigator.pushNamed(context, RouteNames.allProductsViewRoute);
          if (kDebugMode) {
            print("Post Api successful");
          }
          FlushbarHelper.successMessageFlushBar(
              state.message.toString(), context);
        }
      },
      child: BlocBuilder<UpdateProductBloc, UpdateProductStates>(
          buildWhen: (previous, current) =>
              previous.statuses != current.statuses,
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                if (widget.globalKey.currentState?.validate() ?? false) {
                  context.read<UpdateProductBloc>().add(SubmitUpdateProduct(
                        id: widget.id,
                        name: widget.nameController.text.trim(),
                        description: widget.descriptionController.text.trim(),
                        price: widget.priceController.text.trim(),
                        quantity: widget.quantityController.text.trim(),
                      ));
                  if (kDebugMode) {
                    print("Hemlo g");
                  }
                }
              },
              child: Container(
                height: widget.height,
                width: widget.widget,
                decoration: BoxDecoration(
                  color: Color(widget.buttonColor),
                  borderRadius: widget.borderRadius,
                ),
                child: Center(
                  child: state.statuses == Statuses.loading
                      ? CircularProgressIndicator()
                      : Text(
                          widget.buttonText,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                ),
              ),
            );
          }),
    );
  }
}
