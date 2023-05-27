// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      date: DateTime.parse(json['date'] as String),
      from: json['send_by_id'] as int,
      id: json['id'] as int,
      text: json['text'] as String,
      to: json['user_id'] as int,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'date': instance.date.toIso8601String(),
      'send_by_id': instance.from,
      'user_id': instance.to,
    };
