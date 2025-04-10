// delete_product_firestore_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/data/repository/delete_product_repository/delete_product_repository.dart';

class DeleteProductFirestoreRepository implements DeleteProductRepository {
  @override
  Future<void> deleteProduct({required String productId}) async {
    await FirebaseFirestore.instance.collection("products").doc(productId).delete();
  }
}
