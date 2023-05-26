import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String? token;
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'is_kno')
  bool? isKno;
  @JsonKey(name: 'nadzor_organ_id')
  int? knoId;
  UserInfo({this.token, this.email, this.id, this.name});
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
