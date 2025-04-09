import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_events.dart';
import 'package:ecommerce_bloc/bloc/add_products_bloc/add_product_states.dart';
import 'package:ecommerce_bloc/data/repository/add_product_repository/add_product_repository.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';
import 'package:ecommerce_bloc/utils/enums.dart';

class AddProductBloc extends Bloc<AddProductEvents, AddProductStates> {
  AddProductRepository addProductRepository;
  AddProductBloc({required this.addProductRepository})
      : super(AddProductStates()) {
    on<ProductNameChangedEvent>(_productNameEventChanged);
    on<ProductQuantityChangedEvent>(_productQuantityEventChanged);
    on<ProductDescriptionChangedEvent>(_productDescriptionEventChanged);
    on<ProductPriceChangedEvent>(_productPriceEventChanged);
    on<AddProductEvent>(_addProductEvent);
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

  void _addProductEvent(
      AddProductEvent event, Emitter<AddProductStates> emit) async {
      emit(state.copyWith(statuses: Statuses.loading));
    ProductModel productModel = ProductModel(
        name: state.productName.toString(),
        price: state.productPrice.toString(),
        quantity: state.productQuantity.toString(),
        description: state.productDescription.toString());

    await addProductRepository.uploadProducts(productModel).then((value){
      emit(state.copyWith(
        statuses: Statuses.success,
        message: "Successfully uploaded the product"
      ));
    
    }).onError((error,stackTrace){
      emit(state.copyWith(message: error.toString(),
      statuses: Statuses.error));
    });
  }
}
