import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_bloc.dart';
import 'package:ecommerce_bloc/main.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/app_bar_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/button_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/description_input_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/image_picker_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/name_input_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/price_input_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/quantity_input_widget.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  late AddProductBloc addProductBloc;

  @override
  void initState() {
    super.initState();
    addProductBloc = AddProductBloc(addProductRepository: getIt());
  }

  var nameFocusNode = FocusNode();
  var descriptionFocusNode = FocusNode();
  var priceFocusNode = FocusNode();
  var quantityFocusNode = FocusNode();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addProductBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => addProductBloc,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: AppBarWidget(title: "Add Product")),
          body:  SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Form(
                  key: key,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: "Enter Product Details"),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ImagePickerWidget(),
                        ),
                        const SizedBox(height: 10,),
                        NameInputWidget(focusNode: nameFocusNode,
                        controller: nameController,),
                        const SizedBox(
                          height: 10,
                        ),
                        DescriptionInputWidget(focusNode: descriptionFocusNode,
                        controller:descriptionController,),
                        const SizedBox(
                          height: 10,
                        ),
                        PriceInputWidget(focusNode: priceFocusNode,
                        controller: priceController,),
                        const SizedBox(
                          height: 10,
                        ),
                        QuantityInputWidget(focusNode: quantityFocusNode,
                        controller: quantityController,),
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                            child: ButtonWidget(
                          globalKey: key,
                       
                          nameController: nameController,
                          descriptionController: descriptionController,
                          priceController: priceController,
                          quantityController: quantityController,
                          borderRadius: BorderRadius.circular(10),
                          buttonText: "Add Product",
                          buttonColor: 0xff2196f3,
                          height: 40,
                          widget: 250,
                        ))
                      ],
                    ),
                  )),
            )),
     ),
    );
  }
}
