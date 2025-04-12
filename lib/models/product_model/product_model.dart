import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "description") @Default("") String description,
    @JsonKey(name: "price") @Default("") String price,
    @JsonKey(name: "quantity") @Default("") String quantity,
    @JsonKey(name: "image") @Default("") String image,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
      
        @override
        // TODO: implement description
        String get description => throw UnimplementedError();
      
        @override
        // TODO: implement id
        String? get id => throw UnimplementedError();
      
        @override
        // TODO: implement image
        String get image => throw UnimplementedError();
      
        @override
        // TODO: implement name
        String get name => throw UnimplementedError();
      
        @override
        // TODO: implement price
        String get price => throw UnimplementedError();
      
        @override
        // TODO: implement quantity
        String get quantity => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
}
