// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String?,
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      address: json['address'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      image: json['image'] as String? ?? "",
      role: json['role'] as String? ?? "",
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'address': instance.address,
      'gender': instance.gender,
      'image': instance.image,
      'role': instance.role,
    };
