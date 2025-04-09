import 'package:ecommerce_bloc/data/response/firestore_response/firestore_response.dart';
import 'package:equatable/equatable.dart';

class FetchAllProductsStates extends Equatable {
  FirestoreResponse firestoreResponse;
  FetchAllProductsStates({
    required this.firestoreResponse,
  });

  FetchAllProductsStates copyWith({FirestoreResponse? firestoreResponse}) {
    return FetchAllProductsStates(
        firestoreResponse: firestoreResponse ?? this.firestoreResponse);
  }

  @override
  List<Object> get props => [firestoreResponse];
}
