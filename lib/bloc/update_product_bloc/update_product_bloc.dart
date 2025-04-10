import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_events.dart';
import 'package:ecommerce_bloc/bloc/update_product_bloc/update_product_states.dart';
import 'package:ecommerce_bloc/data/repository/update_product_repository/update_product_repository.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvents, UpdateProductStates> {
  UpdateProductRepository updateProductRepository;
  UpdateProductBloc({required this.updateProductRepository})
      : super(UpdateProductStates()) {
    on<UpdateNameEvent>(_updateNameEvent);
    on<UpdateQuantityEvent>(_updateQuantityEvent);
    on<UpdateDescriptionEvent>(_updateDescriptionEvent);
    on<UpdatePriceEvent>(_updatePriceEvent);
    on<SubmitUpdateProduct>(_submitUpdateProduct);
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

  void _submitUpdateProduct(
      SubmitUpdateProduct event, Emitter<UpdateProductStates> emit) async {
    emit(state.copyWith(statuses: Statuses.loading));
    ProductModel productModel = ProductModel(
        name: event.name.toString(),
        id: event.id.toString(),
        quantity: event.quantity.toString(),
        price: event.price.toString(),
        description: event.description.toString());
    if (kDebugMode) {
      print("Updated Name of product ${productModel.name.toString()}");
      print(
          "Updated Description of product ${productModel.description.toString()}");
      print("Updated Price of product ${productModel.price.toString()}");
      print("Updated Quantity of product ${productModel.quantity.toString()}");
    }

    await updateProductRepository.updateProduct(productModel).then((value) {
      emit(state.copyWith(
          statuses: Statuses.success, message: "Product Updated Successfully"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(statuses: Statuses.error, message: error.toString()));
    });
  }
}
