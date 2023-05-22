import 'package:json_annotation/json_annotation.dart';

part 'services.g.dart';

@JsonSerializable()
class Services {
  int id;
  String name;
  String description;

  Services({required this.id, required this.name, required this.description});

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}
