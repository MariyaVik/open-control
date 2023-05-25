import 'package:json_annotation/json_annotation.dart';

part 'consultation.g.dart';

@JsonSerializable(includeIfNull: false)
class Consultation {
  @JsonKey(name: 'nadzor_organ_id')
  int? knoId;

  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'control_type_id')
  int? controlTypeId;

  @JsonKey(name: 'consult_topic_id')
  int? consultTopicId;

  String? time;
  String? date;
  String? question;

  @JsonKey(name: 'is_need_letter')
  bool? isNeedLetter;

  @JsonKey(name: 'is_confirmed')
  bool? isConfirmed;

  Consultation({
    this.consultTopicId,
    this.controlTypeId,
    this.date,
    this.isNeedLetter,
    this.knoId,
    this.time,
    this.userId,
    this.question,
    this.isConfirmed,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);
  Map<String, dynamic> toJson() => _$ConsultationToJson(this);

  @override
  String toString() {
    return 'knoId: $knoId\nuserId: $userId\ncontrolTypeId: $controlTypeId\nconsultTopicId: $consultTopicId\ntime: $time\ndate: $date\nquestion: $question\nisNeedLetter: $isNeedLetter/nisConfirmed: $isConfirmed';
  }
}
