import 'package:json_annotation/json_annotation.dart';

import 'hint_button.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final int id;
  final String text;

  final DateTime date;

  @JsonKey(name: 'send_by_id')
  final int from;

  @JsonKey(name: 'user_id')
  final int to;

  Message(
      {required this.date,
      required this.from,
      required this.id,
      required this.text,
      required this.to});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
