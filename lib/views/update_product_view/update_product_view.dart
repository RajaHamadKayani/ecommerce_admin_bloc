import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_bloc.dart';
import 'package:ecommerce_bloc/main.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/app_bar_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/text_widget.dart';
import 'package:ecommerce_bloc/views/update_product_view/widgets/update_button_widget.dart';
import 'package:ecommerce_bloc/views/update_product_view/widgets/update_description_input_widget.dart';
import 'package:ecommerce_bloc/views/update_product_view/widgets/update_name_input_widget.dart';
import 'package:ecommerce_bloc/views/update_product_view/widgets/update_price_input_widget.dart';
import 'package:ecommerce_bloc/views/update_product_view/widgets/update_quantity_inpuut_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateProductView extends StatefulWidget {
  String ?currentName;
  String? currentDescription;
  String ?currentPrice;
  String ?currentQuantity;
  String ? id;
   UpdateProductView({super.key,
   this.currentDescription,
   this.currentName,
   this.currentPrice,
   this.id,
   this.currentQuantity});

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  late UpdateProductBloc updateProductBloc;
    var nameFocusNode = FocusNode();
  var descriptionFocusNode = FocusNode();
  var priceFocusNode = FocusNode();
  var quantityFocusNode = FocusNode();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    updateProductBloc = UpdateProductBloc(updateProductRepository: getIt());
    nameController.text=widget.currentName.toString();
    descriptionController.text=widget.currentDescription.toString();
    priceController.text=widget.currentPrice.toString();
    quantityController.text=widget.currentQuantity.toString();
  }



  @override
  void dispose() {
    super.dispose();
    updateProductBloc.close();
  }

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => updateProductBloc,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBarWidget(title: "Update Product")),
        body: SafeArea(
          child: Form(
            key: globalKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Update Product Details"),
                    const SizedBox(
                      height: 20,
                    ),
                    UpdateNameInputWidget(
                        focusNode: nameFocusNode, controller: nameController),
                    const SizedBox(
                      height: 10,
                    ),
                    UpdateDescriptionInputWidget(
                        focusNode: descriptionFocusNode, controller: descriptionController),
                    const SizedBox(
                      height: 10,
                    ),
                    UpdatePriceInputWidget(
                        focusNode: priceFocusNode, controller: priceController),
                    const SizedBox(
                      height: 10,
                    ),
                    UpdateQuantityInpuutWidget(
                        focusNode: quantityFocusNode, controller: quantityController),
                      const SizedBox(
                          height: 40,
                        ),
                        Center(
                            child: UpdateButtonWidget(
                          globalKey: globalKey,
                       id: widget.id ?? "",
                          nameController: nameController,
                          descriptionController: descriptionController,
                          priceController: priceController,
                          quantityController: quantityController,
                          borderRadius: BorderRadius.circular(10),
                          buttonText: "Update Product",
                          buttonColor: 0xff2196f3,
                          height: 40,
                          widget: 250,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
