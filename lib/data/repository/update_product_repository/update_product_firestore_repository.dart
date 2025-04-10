import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/data/repository/update_product_repository/update_product_repository.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';

class UpdateProductFirestoreRepository implements UpdateProductRepository {
  @override
  Future<ProductModel> updateProduct(ProductModel model) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('products').doc(model.id);

      await docRef.update({
        'name': model.name,
        'description': model.description,
        'price': model.price,
        'quantity': model.quantity,
        // Add other fields if your model has them
      });

      return model;
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }
}
