// delete_product_bloc.dart
import 'package:ecommerce_bloc/bloc/delete_product_bloc/delete_product_event.dart';
import 'package:ecommerce_bloc/bloc/delete_product_bloc/delete_product_states.dart';
import 'package:ecommerce_bloc/data/repository/delete_product_repository/delete_product_repository.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final DeleteProductRepository deleteProductRepository;

  DeleteProductBloc({required this.deleteProductRepository})
      : super(DeleteProductState.initial()) {
    on<DeleteSpecificProduct>(_onDeleteProduct);
  }

  Future<void> _onDeleteProduct(
      DeleteSpecificProduct event, Emitter<DeleteProductState> emit) async {
    emit(state.copyWith(statuses: Statuses.loading));
    try {
      await deleteProductRepository.deleteProduct(productId: event.productId);
      emit(state.copyWith(
          statuses: Statuses.success, message: "Product deleted successfully"));
    } catch (e) {
      emit(state.copyWith(statuses: Statuses.error, message: e.toString()));
    }
  }
}
