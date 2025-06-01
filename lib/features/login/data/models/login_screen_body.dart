import 'package:json_annotation/json_annotation.dart';
part 'login_screen_body.g.dart';
@JsonSerializable()
class LoginRequestBody {
  final String email;      // Non-nullable
  final String password;   // Non-nullable

  LoginRequestBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
