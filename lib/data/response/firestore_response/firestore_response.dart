import 'package:ecommerce_bloc/utils/enums.dart';

class FirestoreResponse<T> {
  String? message;
  Statuses? statuses;
  T? data;
FirestoreResponse(this.data,this.message,this.statuses);
FirestoreResponse.isLoading():statuses=Statuses.loading;
FirestoreResponse.isCompleted(this.data):statuses=Statuses.success;
FirestoreResponse.isError(this.message):statuses=Statuses.error;
FirestoreResponse.isInitiall():statuses=Statuses.initial;

@override
String toString(){
  return "message: $message status: $statuses data $data";
}
}
