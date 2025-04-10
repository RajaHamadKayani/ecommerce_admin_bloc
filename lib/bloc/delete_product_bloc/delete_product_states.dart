// delete_product_states.dart
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';

class DeleteProductState extends Equatable {
  final Statuses statuses;
  final String? message;

  const DeleteProductState({required this.statuses, this.message});

  factory DeleteProductState.initial() {
    return DeleteProductState(statuses: Statuses.initial);
  }

  DeleteProductState copyWith({Statuses? statuses, String? message}) {
    return DeleteProductState(
      statuses: statuses ?? this.statuses,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [statuses, message];
}
