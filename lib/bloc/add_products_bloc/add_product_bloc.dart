import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:ecommerce_bloc/data/repository/add_product_repository/add_product_repository.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/image_picker_util.dart';
import 'package:ecommerce_bloc/utils/extensions/upload_image_to_cloudinary.dart';
import 'package:image_picker/image_picker.dart';

class AddProductBloc extends Bloc<AddProductEvents, AddProductStates> {
  AddProductRepository addProductRepository;
  ImagePickerUtil imagePickerUtil = ImagePickerUtil();
  AddProductBloc({required this.addProductRepository})
      : super(AddProductStates()) {
    on<ProductNameChangedEvent>(_productNameEventChanged);
    on<ProductQuantityChangedEvent>(_productQuantityEventChanged);
    on<ProductDescriptionChangedEvent>(_productDescriptionEventChanged);
    on<ProductPriceChangedEvent>(_productPriceEventChanged);
    on<AddProductEvent>(_addProductEvent);
    on<ProductImageChangedEvent>(_productImageChangedEvent);
  }

  void _productDescriptionEventChanged(
      ProductDescriptionChangedEvent event, Emitter<AddProductStates> emit) {
    emit(state.copyWith(productDescription: event.productDescription));
  }

  void _productNameEventChanged(
      ProductNameChangedEvent event, Emitter<AddProductStates> emit) {
    emit(state.copyWith(productName: event.productName));
  }

  void _productQuantityEventChanged(
      ProductQuantityChangedEvent event, Emitter<AddProductStates> emit) {
    emit(state.copyWith(productQuantity: event.productQuantity));
  }

  void _productPriceEventChanged(
      ProductPriceChangedEvent event, Emitter<AddProductStates> emit) {
    emit(state.copyWith(productPrice: event.productPrice));
  }

  void _productImageChangedEvent(
      ProductImageChangedEvent event, Emitter<AddProductStates> emit) async {
    XFile? image = await imagePickerUtil.getImage();
    emit(state.copyWith(image: image));
  }

  void _addProductEvent(
      AddProductEvent event, Emitter<AddProductStates> emit) async {
    emit(state.copyWith(statuses: Statuses.loading));

    File? imageFile = state.image != null ? File(state.image!.path) : null;

    String uploadedImageUrl = "";

    // Upload image to Cloudinary first
    if (imageFile != null) {
      uploadedImageUrl =
          await UploadImageToCloudinary.uploadImageToCloudinary(imageFile);
    }

    ProductModel productModel = ProductModel(
      name: state.productName,
      description: state.productDescription,
      price: state.productPrice,
      quantity: state.productQuantity,
      image: uploadedImageUrl, // now properly assigned
    );

    await addProductRepository.uploadProducts(productModel).then((value) {
      emit(state.copyWith(
          statuses: Statuses.success,
          message: "Successfully uploaded the product"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(message: error.toString(), statuses: Statuses.error));
    });
  }
}
