import 'package:ecommerce_bloc/data/response/firestore_response/firestore_response.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';

abstract class FetchProductRepository {
  Future<List<ProductModel>> fetchProducts();
}