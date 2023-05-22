import 'package:json_annotation/json_annotation.dart';

part 'consult_topics.g.dart';

@JsonSerializable()
class ConsultTopics {
  int id;
  String name;

  ConsultTopics({required this.id, required this.name});

  factory ConsultTopics.fromJson(Map<String, dynamic> json) =>
      _$ConsultTopicsFromJson(json);
  Map<String, dynamic> toJson() => _$ConsultTopicsToJson(this);
}
