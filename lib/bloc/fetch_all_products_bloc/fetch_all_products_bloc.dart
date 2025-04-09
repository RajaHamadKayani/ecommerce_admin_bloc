import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_events.dart';
import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_states.dart';
import 'package:ecommerce_bloc/data/repository/fetch_products_repository/fetch_product_repository.dart';
import 'package:ecommerce_bloc/data/response/firestore_response/firestore_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchAllProductsBloc
    extends Bloc<FetchAllProductsEvents, FetchAllProductsStates> {
  FetchProductRepository fetchProductRepository;
  FetchAllProductsBloc({required this.fetchProductRepository})
      : super(FetchAllProductsStates(
            firestoreResponse: FirestoreResponse.isLoading())) {
    on<FetchProduct>(_fetchProduct);
  }

  void _fetchProduct(
      FetchProduct event, Emitter<FetchAllProductsStates> emit) async {
    await fetchProductRepository.fetchProducts().then((products) {
      emit(state.copyWith(
      
          firestoreResponse: FirestoreResponse.isCompleted(products)));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          firestoreResponse: FirestoreResponse.isError(error.toString())));
    });
  }
}
