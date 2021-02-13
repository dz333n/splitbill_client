import 'package:json_annotation/json_annotation.dart';

part 'login_information.g.dart';

@JsonSerializable()
class LoginInformation {
  final String email;
  final String password;

  LoginInformation({ this.email, this.password });

  factory LoginInformation.fromJson(Map<String, dynamic> json) => _$LoginInformationFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInformationToJson(this);
}