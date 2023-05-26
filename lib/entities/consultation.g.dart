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
      isConfirmed: json['is_confirmed'] as bool?,
      slotId: json['slot_id'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ConsultationToJson(Consultation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('nadzor_organ_id', instance.knoId);
  writeNotNull('user_id', instance.userId);
  writeNotNull('control_type_id', instance.controlTypeId);
  writeNotNull('consult_topic_id', instance.consultTopicId);
  writeNotNull('slot_id', instance.slotId);
  writeNotNull('time', instance.time);
  writeNotNull('date', instance.date);
  writeNotNull('question', instance.question);
  writeNotNull('is_need_letter', instance.isNeedLetter);
  writeNotNull('is_confirmed', instance.isConfirmed);
  return val;
}
