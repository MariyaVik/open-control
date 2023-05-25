// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessUser _$BusinessUserFromJson(Map<String, dynamic> json) => BusinessUser(
      token: json['token'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BusinessUserToJson(BusinessUser instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
