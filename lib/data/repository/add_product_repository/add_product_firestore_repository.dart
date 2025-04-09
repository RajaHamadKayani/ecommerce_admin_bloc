import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/models/product_model/product_model.dart';
import 'package:ecommerce_bloc/data/repository/add_product_repository/add_product_repository.dart';

class AddProductFirestoreRepository implements AddProductRepository {
  @override
  Future<ProductModel> uploadProducts(ProductModel model) async {
    // Step 1: Get a new document reference with auto-generated ID
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('products').doc();

    // Step 2: Assign the generated ID to the model
    final updatedModel = model.copyWith(id: docRef.id);

    // Step 3: Convert model to JSON
    final json = updatedModel.toJson();

    // Step 4: Upload to Firestore
    await docRef.set(json);

    // Step 5: Return the uploaded model (optional)
    return updatedModel;
  }
}
