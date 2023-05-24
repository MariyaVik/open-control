// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consultation _$ConsultationFromJson(Map<String, dynamic> json) => Consultation(
      consultTopicId: json['consult_topic_id'] as int?,
      controlTypeId: json['control_type_id'] as int?,
      date: json['date'] as String?,
      isNeedLetter: json['is_need_letter'] as bool?,
      knoId: json['nadzor_organ_id'] as int?,
      time: json['time'] as String?,
      userId: json['user_id'] as int?,
      question: json['question'] as String?,
    );

Map<String, dynamic> _$ConsultationToJson(Consultation instance) =>
    <String, dynamic>{
      'nadzor_organ_id': instance.knoId,
      'user_id': instance.userId,
      'control_type_id': instance.controlTypeId,
      'consult_topic_id': instance.consultTopicId,
      'time': instance.time,
      'date': instance.date,
      'question': instance.question,
      'is_need_letter': instance.isNeedLetter,
    };
