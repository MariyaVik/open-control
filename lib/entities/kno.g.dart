// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NadzorOrgans _$NadzorOrgansFromJson(Map<String, dynamic> json) => NadzorOrgans(
      id: json['id'] as int,
      name: json['name'] as String,
      controlTypes: (json['control_types'] as List<dynamic>?)
              ?.map((e) => ControlTypes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NadzorOrgansToJson(NadzorOrgans instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'control_types': instance.controlTypes.map((e) => e.toJson()).toList(),
    };
