import 'package:json_annotation/json_annotation.dart';
import 'consult_topics.dart';

part 'control_types.g.dart';

@JsonSerializable(explicitToJson: true)
class ControlTypes {
  int id;
  String name;
  @JsonKey(name: 'consult_topics')
  List<ConsultTopics> consultTopics;

  ControlTypes(
      {required this.id, required this.name, required this.consultTopics});

  // static ConsultTopics _fromJson(Map<String, dynamic> json) => ConsultTopics.fromJson(json);
  // static String _toJson(ConsultTopics object) => object.toString();
  factory ControlTypes.fromJson(Map<String, dynamic> json) =>
      _$ControlTypesFromJson(json);
  Map<String, dynamic> toJson() => _$ControlTypesToJson(this);
}
