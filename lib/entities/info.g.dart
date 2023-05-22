// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      nadzorOrgans: (json['nadzor_organs'] as List<dynamic>)
          .map((e) => NadzorOrgans.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => Services.fromJson(e as Map<String, dynamic>))
          .toList(),
      pravActs: json['prav_acts'] as List<dynamic>?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'nadzor_organs': instance.nadzorOrgans.map((e) => e.toJson()).toList(),
      'services': instance.services.map((e) => e.toJson()).toList(),
      'prav_acts': instance.pravActs,
    };
