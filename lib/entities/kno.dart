import 'package:json_annotation/json_annotation.dart';
import 'control_types.dart';

part 'kno.g.dart';

@JsonSerializable(explicitToJson: true)
class NadzorOrgans {
  int id;
  String name;
  @JsonKey(name: 'control_types')
  List<ControlTypes> controlTypes;

  NadzorOrgans(
      {required this.id, required this.name, required this.controlTypes});

  factory NadzorOrgans.fromJson(Map<String, dynamic> json) =>
      _$NadzorOrgansFromJson(json);
  Map<String, dynamic> toJson() => _$NadzorOrgansToJson(this);
}
