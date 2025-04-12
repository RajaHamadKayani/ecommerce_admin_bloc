import 'dart:io';

import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_events.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_states.dart';
import 'package:ecommerce_bloc/data/repository/update_product_repository/update_product_repository.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/image_picker_util.dart';
import 'package:ecommerce_bloc/utils/extensions/upload_image_to_cloudinary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvents, UpdateProductStates> {
  UpdateProductRepository updateProductRepository;
  ImagePickerUtil imagePickerUtil = ImagePickerUtil();
  UpdateProductBloc({required this.updateProductRepository})
      : super(UpdateProductStates()) {
    on<UpdateNameEvent>(_updateNameEvent);
    on<UpdateQuantityEvent>(_updateQuantityEvent);
    on<UpdateDescriptionEvent>(_updateDescriptionEvent);
    on<UpdatePriceEvent>(_updatePriceEvent);
    on<UpdateProductButtonPressedEvent>(_submitUpdateProduct);
    on<UpdateImageEvent>(_updateImageEvent);
  }
  void _updateDescriptionEvent(
      UpdateDescriptionEvent event, Emitter<UpdateProductStates> emit) {
    emit(state.copyWith(productDescription: event.productDescription));
    if (kDebugMode) {
      print(
          "Updated Product Description is ${state.productDescription.toString()}");
    }
  }

  void _updateNameEvent(
      UpdateNameEvent event, Emitter<UpdateProductStates> emit) {
    emit(state.copyWith(productName: event.name));
    if (kDebugMode) {
      print("Updated Product Name is ${state.productName.toString()}");
    }
  }

  void _updateQuantityEvent(
      UpdateQuantityEvent event, Emitter<UpdateProductStates> emit) {
    emit(state.copyWith(productQuantity: event.productQuantity));
    if (kDebugMode) {
      print("Updated Product Quantity is ${state.productQuantity.toString()}");
    }
  }

  void _updatePriceEvent(
      UpdatePriceEvent event, Emitter<UpdateProductStates> emit) {
    emit(state.copyWith(productPrice: event.productPrice));
    if (kDebugMode) {
      print("Updated Product Price is ${state.productPrice.toString()}");
    }
  }

  void _updateImageEvent(
      UpdateImageEvent event, Emitter<UpdateProductStates> emit) async {
    XFile? image = await imagePickerUtil.getImage();
    emit(state.copyWith(image: image));
  }

  void _submitUpdateProduct(UpdateProductButtonPressedEvent event,
      Emitter<UpdateProductStates> emit) async {
    emit(state.copyWith(statuses: Statuses.loading));

    try {
      String imageUrl = event.oldImageUrl;

      // if new image picked, upload it and use the new URL
      if (event.newImageFile != null) {
        imageUrl = await UploadImageToCloudinary.uploadImageToCloudinary(
            event.newImageFile!);
      }

      ProductModel productModel = ProductModel(
        id: event.productId,
        name: event.name,
        description: event.description,
        price: event.price,
        quantity: event.quantity,
        image: imageUrl,
      );

      await updateProductRepository.updateProduct(productModel);

      emit(state.copyWith(statuses: Statuses.success));
    } catch (e) {
      emit(state.copyWith(
        statuses: Statuses.error,
        message: e.toString(),
      ));
    }
  }
}
