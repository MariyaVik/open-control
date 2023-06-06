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
      vksLink: json['vks_link'] as String?,
      answer: json['answer'] as String?,
      videoLink: json['video_link'] as String?,
      consultTopic: json['consult_topic'] == null
          ? null
          : ConsultTopics.fromJson(
              json['consult_topic'] as Map<String, dynamic>),
      controlType: json['control_type'] == null
          ? null
          : ControlTypes.fromJson(json['control_type'] as Map<String, dynamic>),
      kno: json['nadzor_organ'] == null
          ? null
          : NadzorOrgans.fromJson(json['nadzor_organ'] as Map<String, dynamic>),
    )..user = json['user'] == null
        ? null
        : UserInfo.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$ConsultationToJson(Consultation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('nadzor_organ_id', instance.knoId);
  writeNotNull('nadzor_organ', instance.kno?.toJson());
  writeNotNull('user_id', instance.userId);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('control_type_id', instance.controlTypeId);
  writeNotNull('control_type', instance.controlType?.toJson());
  writeNotNull('consult_topic_id', instance.consultTopicId);
  writeNotNull('consult_topic', instance.consultTopic?.toJson());
  writeNotNull('slot_id', instance.slotId);
  writeNotNull('time', instance.time);
  writeNotNull('date', instance.date);
  writeNotNull('question', instance.question);
  writeNotNull('answer', instance.answer);
  writeNotNull('is_need_letter', instance.isNeedLetter);
  writeNotNull('is_confirmed', instance.isConfirmed);
  writeNotNull('vks_link', instance.vksLink);
  writeNotNull('video_link', instance.videoLink);
  return val;
}
