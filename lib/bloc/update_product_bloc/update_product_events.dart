import 'package:equatable/equatable.dart';

abstract class UpdateProductEvents extends Equatable{
  @override
  List<Object?> get props=>[];
  const UpdateProductEvents();
}

// ignore: must_be_immutable
class UpdateNameEvent extends UpdateProductEvents{
  String name;
  UpdateNameEvent({required this.name});
  @override
  List<Object?> get props=>[name];
}

// ignore: must_be_immutable
class UpdateDescriptionEvent extends UpdateProductEvents{
  String productDescription;
  UpdateDescriptionEvent({required this.productDescription});
  @override
List<Object?> get props=>[productDescription];
}

// ignore: must_be_immutable
class UpdatePriceEvent extends UpdateProductEvents{
  String productPrice;
  UpdatePriceEvent({required this.productPrice});
  @override
  List<Object?> get props=>[productPrice];
}
// ignore: must_be_immutable
class UpdateQuantityEvent extends UpdateProductEvents{
String productQuantity;
UpdateQuantityEvent({required this.productQuantity});
@override
List<Object?> get props=> [productQuantity];
}
// ignore: must_be_immutable
class UpdateImageEvent extends UpdateProductEvents{
  String id;
  String imageUrl;
  UpdateImageEvent({required this.id,
  required this.imageUrl});
  @override
  List<Object?> get props=>[id,imageUrl];
}
class SubmitUpdateProduct extends UpdateProductEvents{
    final String id;
  final String name;
  final String description;
String  image;
  final String price;
  final String quantity;
  SubmitUpdateProduct({
    required this.id,
    required this.name,
   required this.image,
    required this.description,
    required this.price,
    required this.quantity,
  });  @override
  List<Object?> get props=>[];
}