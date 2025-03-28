import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_validations_state.freezed.dart';

@freezed
class PasswordValidationsState with _$PasswordValidationsState {
  const factory PasswordValidationsState({
    @Default(false) bool hasLowercase,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasSpecialCharacters,
    @Default(false) bool hasNumber,
    @Default(false) bool hasMinLength,
  }) = _PasswordValidationsState;
}
