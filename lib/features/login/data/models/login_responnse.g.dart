// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_responnse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponnse _$LoginResponnseFromJson(Map<String, dynamic> json) =>
    LoginResponnse(
      message: json['message'] as String?,
      userData: json['data'] as String?,
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponnseToJson(LoginResponnse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userData,
      'status': instance.status,
      'code': instance.code,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  token: json['token'] as String?,
  userName: json['username'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'token': instance.token,
  'username': instance.userName,
};
