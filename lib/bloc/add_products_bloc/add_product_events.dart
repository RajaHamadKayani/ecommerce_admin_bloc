import 'package:equatable/equatable.dart';

class AddProductEvents extends Equatable {
  const AddProductEvents();
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ProductNameChangedEvent extends AddProductEvent{
  String productName;
  ProductNameChangedEvent({required this.productName});
  @override
  List<Object?> get props=>[productName];
}

// ignore: must_be_immutable
class ProductDescriptionChangedEvent extends AddProductEvent{
  String productDescription;
  ProductDescriptionChangedEvent({required this.productDescription});
  @override
List<Object?> get props=>[productDescription];
}

// ignore: must_be_immutable
class ProductPriceChangedEvent extends AddProductEvent{
  String productPrice;
  ProductPriceChangedEvent({required this.productPrice});
  @override
  List<Object?> get props=>[productPrice];
}
// ignore: must_be_immutable
class ProductQuantityChangedEvent extends AddProductEvent{
String productQuantity;
ProductQuantityChangedEvent({required this.productQuantity});
@override
List<Object?> get props=> [productQuantity];
}

class AddProductEvent extends AddProductEvents {}
