// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faq _$FaqFromJson(Map<String, dynamic> json) => Faq(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
      nadzorOrganId: json['nadzor_organ_id'] as int,
      controlTypeId: json['control_type_id'] as int,
      likes: json['likes'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'nadzor_organ_id': instance.nadzorOrganId,
      'control_type_id': instance.controlTypeId,
      'likes': instance.likes,
      'date': instance.date.toIso8601String(),
    };
