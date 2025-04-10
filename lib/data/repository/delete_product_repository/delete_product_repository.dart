// delete_product_repository.dart
abstract class DeleteProductRepository {
  Future<void> deleteProduct({required String productId});
}
