import 'package:json_annotation/json_annotation.dart';

part 'hint_button.g.dart';

@JsonSerializable()
class HintButton {
  final int id;
  final String text;
  final String link;
  HintButton({required this.id, required this.text, required this.link});
  factory HintButton.fromJson(Map<String, dynamic> json) =>
      _$HintButtonFromJson(json);
  Map<String, dynamic> toJson() => _$HintButtonToJson(this);
}
