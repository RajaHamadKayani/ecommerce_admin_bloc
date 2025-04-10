import 'package:ecommerce_bloc/models/product_model/product_model.dart';

abstract class UpdateProductRepository {
  Future<ProductModel> updateProduct(ProductModel model);
}