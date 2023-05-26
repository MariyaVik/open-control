// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      token: json['token'] as String?,
      email: json['email'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    )
      ..isKno = json['is_kno'] as bool?
      ..knoId = json['nadzor_organ_id'] as int?;

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'is_kno': instance.isKno,
      'nadzor_organ_id': instance.knoId,
    };
