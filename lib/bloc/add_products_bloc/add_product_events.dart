import 'package:equatable/equatable.dart';

class AddProductEvents extends Equatable {
  const AddProductEvents();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ProductNameChangedEvent extends AddProductEvents {
  String productName;
  ProductNameChangedEvent({required this.productName});
  @override
  List<Object?> get props => [productName];
}

// ignore: must_be_immutable
class ProductDescriptionChangedEvent extends AddProductEvents {
  String productDescription;
  ProductDescriptionChangedEvent({required this.productDescription});
  @override
  List<Object?> get props => [productDescription];
}

// ignore: must_be_immutable
class ProductPriceChangedEvent extends AddProductEvents {
  String productPrice;
  ProductPriceChangedEvent({required this.productPrice});
  @override
  List<Object?> get props => [productPrice];
}

// ignore: must_be_immutable
class ProductQuantityChangedEvent extends AddProductEvents {
  String productQuantity;
  ProductQuantityChangedEvent({required this.productQuantity});
  @override
  List<Object?> get props => [productQuantity];
}

class ProductImageChangedEvent extends AddProductEvents {}

class AddProductEvent extends AddProductEvents {}
