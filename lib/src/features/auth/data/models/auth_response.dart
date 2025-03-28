import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.g.dart';
part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  @JsonSerializable(explicitToJson: true)
  const factory AuthResponse({
    @JsonKey(name: 'data') UserData? userData,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? token,
    @JsonKey(name: 'username') String? userName,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
