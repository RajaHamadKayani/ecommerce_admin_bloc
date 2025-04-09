import 'package:equatable/equatable.dart';

class FetchAllProductsEvents extends Equatable{ 
  const FetchAllProductsEvents();
  @override
  List<Object?> get props=>[];
}

class FetchProduct extends FetchAllProductsEvents{}