// delete_product_events.dart
import 'package:equatable/equatable.dart';

abstract class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();
  @override
  List<Object?> get props => [];
}

class DeleteSpecificProduct extends DeleteProductEvent {
  final String productId;

  const DeleteSpecificProduct({required this.productId});
  @override
  List<Object?> get props => [productId];
}
