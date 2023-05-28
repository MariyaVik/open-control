import 'package:json_annotation/json_annotation.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq {
  int id;
  String question;
  String answer;
  @JsonKey(name: 'nadzor_organ_id')
  int nadzorOrganId;
  @JsonKey(name: 'control_type_id')
  int controlTypeId;
  int likes;
  DateTime date;

  Faq({
    required this.id,
    required this.question,
    required this.answer,
    required this.nadzorOrganId,
    required this.controlTypeId,
    required this.likes,
    required this.date,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
  Map<String, dynamic> toJson() => _$FaqToJson(this);
}
