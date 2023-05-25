import 'package:json_annotation/json_annotation.dart';

part 'business_user.g.dart';

@JsonSerializable()
class BusinessUser {
  String? token;
  int? id;
  String? name;
  String? email;
  BusinessUser({this.token, this.email, this.id, this.name});
  factory BusinessUser.fromJson(Map<String, dynamic> json) =>
      _$BusinessUserFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessUserToJson(this);
}
