import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final String gender;

  const RegisterRequestBody({
    this.name = 'name',
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.phone = '1234567890',
    this.gender = '0',
  });

  factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
