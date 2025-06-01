
import 'package:json_annotation/json_annotation.dart';

part 'login_responnse.g.dart';

  @JsonSerializable()
class LoginResponnse {
  String? message;
    @JsonKey(name:'data')
  String? userData;
  bool? status;
  int? code;


  LoginResponnse({
    this.message,
    this.userData,
    this.status,
    this.code,
  });
  factory LoginResponnse.fromJson(Map<String, dynamic> json) => _$LoginResponnseFromJson(json);

}
  @JsonSerializable()
  class UserData{
    String? token;
    @JsonKey(name:'username')
    String? userName;

    UserData({this.token, this.userName});
    factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  }