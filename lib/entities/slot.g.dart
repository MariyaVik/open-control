// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slot _$SlotFromJson(Map<String, dynamic> json) => Slot(
      date: json['date'] as String,
      id: json['id'] as int,
      time: json['time'] as String,
      consultation: json['consultation'] == null
          ? null
          : Consultation.fromJson(json['consultation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'date': instance.date,
      'consultation': instance.consultation?.toJson(),
    };
