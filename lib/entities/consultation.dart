import 'package:json_annotation/json_annotation.dart';
import 'package:open_control/entities/user_info.dart';

import 'consult_topics.dart';
import 'control_types.dart';
import 'kno.dart';

part 'consultation.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Consultation {
  int? id;

  @JsonKey(name: 'nadzor_organ_id')
  int? knoId;

  @JsonKey(name: 'nadzor_organ')
  NadzorOrgans? kno;

  @JsonKey(name: 'user_id')
  int? userId;

  UserInfo? user;

  @JsonKey(name: 'control_type_id')
  int? controlTypeId;

  @JsonKey(name: 'control_type')
  ControlTypes? controlType;

  @JsonKey(name: 'consult_topic_id')
  int? consultTopicId;

  @JsonKey(name: 'consult_topic')
  ConsultTopics? consultTopic;

  @JsonKey(name: 'slot_id')
  int? slotId;

  String? time;
  String? date;
  String? question;
  String? answer;

  @JsonKey(name: 'is_need_letter')
  bool? isNeedLetter;

  @JsonKey(name: 'is_confirmed')
  bool? isConfirmed;

  @JsonKey(name: 'vks_link')
  String? vksLink;

  @JsonKey(name: 'video_link')
  String? videoLink;

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
    this.slotId,
    this.id,
    this.vksLink,
    this.answer,
    this.videoLink,
    this.consultTopic,
    this.controlType,
    this.kno,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);
  Map<String, dynamic> toJson() => _$ConsultationToJson(this);

  @override
  String toString() {
    return 'id: $id\nknoId: $knoId\nuserId: $userId\ncontrolTypeId: $controlTypeId\nconsultTopicId: $consultTopicId\ntime: $time\ndate: $date\nquestion: $question\nisNeedLetter: $isNeedLetter\nisConfirmed: $isConfirmed\nslotId: $slotId\nvskLink: $vksLink';
  }
}
