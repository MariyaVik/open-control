import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
  final String id;
  final DateTime date;
  final String text;
  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'consultation_id')
  final int consultationId;
  Notifications({
    required this.id,
    required this.date,
    required this.text,
    required this.userId,
    required this.consultationId,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
