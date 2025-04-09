import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/data/repository/fetch_products_repository/fetch_product_repository.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';

class FetchProductsFirebaseRepository implements FetchProductRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final querySnapshot =
          await firebaseFirestore.collection("products").get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
          return products;
    } catch (e) {
      throw Exception("Error while fetching the products ${e.toString()}");
    }
  }
}
