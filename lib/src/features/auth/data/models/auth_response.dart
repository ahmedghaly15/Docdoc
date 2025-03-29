import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/user_model.dart';

part 'auth_response.g.dart';
part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  @JsonSerializable(explicitToJson: true)
  const factory AuthResponse({
    @JsonKey(name: 'data') UserModel? userData,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
