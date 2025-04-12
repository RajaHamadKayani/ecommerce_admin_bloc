import 'dart:io';

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
// ignore: must_be_immutable
class UpdateProductButtonPressedEvent extends UpdateProductEvents {
  final String productId;
  final String name;
  final String description;
  final String price;
  final String quantity;
  final String oldImageUrl;
  final File? newImageFile;

  UpdateProductButtonPressedEvent({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.oldImageUrl,
    required this.newImageFile,
  });
}