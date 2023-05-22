import 'package:json_annotation/json_annotation.dart';

import 'kno.dart';
import 'services.dart';

part 'info.g.dart';

@JsonSerializable(explicitToJson: true)
class Info {
  @JsonKey(name: 'nadzor_organs')
  List<NadzorOrgans> nadzorOrgans;
  List<Services> services;
  @JsonKey(name: 'prav_acts')
  List? pravActs;

  Info({required this.nadzorOrgans, required this.services, this.pravActs});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
