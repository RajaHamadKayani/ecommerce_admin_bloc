import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';

class AddProductStates extends Equatable {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productQuantity;
final Statuses statuses;
final String message;
  const AddProductStates({
    this.productName = '',
    this.productDescription = '',
    this.statuses=Statuses.initial,
    this.productPrice = '',
    this.productQuantity = '',
    this.message=''
  });

  AddProductStates copyWith({
    String? productName,
    String? productDescription,
    String? productPrice,
    String ? message,
    Statuses ? statuses,
    String? productQuantity,
  }) {
    return AddProductStates(
      productName: productName ?? this.productName,
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
        message
      ];
}
