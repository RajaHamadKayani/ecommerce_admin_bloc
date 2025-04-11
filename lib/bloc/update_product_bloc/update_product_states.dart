import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProductStates extends Equatable {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productQuantity;
final Statuses statuses;
final XFile ? image;
final String message;
  const UpdateProductStates({
    this.productName = '',
    this.productDescription = '',
    this.statuses=Statuses.initial,
    this.image,
    this.productPrice = '',
    this.productQuantity = '',
    this.message=''
  });

  UpdateProductStates copyWith({
    String? productName,
    String? productDescription,
    String? productPrice,
    XFile ? image,
    String ? message,
    Statuses ? statuses,
    String? productQuantity,
  }) {
    return UpdateProductStates(
      productName: productName ?? this.productName,
      image: image ?? this.image,
      statuses: statuses ?? this.statuses,
      productDescription: productDescription ?? this.productDescription,
      productPrice: productPrice ?? this.productPrice,
      message: message ?? this.message,
      productQuantity: productQuantity ?? this.productQuantity,
    );
  }

  @override
  List<Object?> get props => [
        productName,
        productDescription,
        productPrice,
        productQuantity,
        statuses,
        message,
        image
      ];
}
