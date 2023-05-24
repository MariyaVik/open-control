// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlTypes _$ControlTypesFromJson(Map<String, dynamic> json) => ControlTypes(
      id: json['id'] as int,
      name: json['name'] as String,
      consultTopics: (json['consult_topics'] as List<dynamic>?)
              ?.map((e) => ConsultTopics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ControlTypesToJson(ControlTypes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'consult_topics': instance.consultTopics.map((e) => e.toJson()).toList(),
    };
