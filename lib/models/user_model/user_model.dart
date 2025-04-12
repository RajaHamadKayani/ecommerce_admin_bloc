import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    @JsonKey(name: "name") @Default("") String name,
    @JsonKey(name: "email") @Default("") String email,
    @JsonKey(name: "password") @Default("") String password,
    @JsonKey(name: "phone") @Default("") String phone,
    @JsonKey(name: "address") @Default("") String address,
    @JsonKey(name: "gender") @Default("") String gender,
    @JsonKey(name: "image") @Default("") String image,
    @JsonKey(name: "role") @Default("") String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
      
        @override
        // TODO: implement address
        String get address => throw UnimplementedError();
      
        @override
        // TODO: implement email
        String get email => throw UnimplementedError();
      
        @override
        // TODO: implement gender
        String get gender => throw UnimplementedError();
      
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
        // TODO: implement password
        String get password => throw UnimplementedError();
      
        @override
        // TODO: implement phone
        String get phone => throw UnimplementedError();
      
        @override
        // TODO: implement role
        String get role => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
}