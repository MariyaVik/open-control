import 'package:json_annotation/json_annotation.dart';
import 'package:open_control/entities/consultation.dart';

part 'slot.g.dart';

@JsonSerializable(explicitToJson: true)
class Slot {
  final int id;
  final String time;
  final String date;
  final Consultation? consultation;
  Slot(
      {required this.date,
      required this.id,
      required this.time,
      this.consultation});

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
  Map<String, dynamic> toJson() => _$SlotToJson(this);
}
