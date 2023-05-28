import 'package:json_annotation/json_annotation.dart';

part 'notifications.g.dart';

@JsonSerializable()
class Notifications {
  final String id;
  final DateTime date;
  final String text;
  @JsonKey(name: 'user_id')
  final String userId;
  Notifications({
    required this.id,
    required this.date,
    required this.text,
    required this.userId,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationsToJson(this);
}
