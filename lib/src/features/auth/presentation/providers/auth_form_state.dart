import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_state.freezed.dart';

@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    @Default(true) bool isObscureText,
    @Default(false) bool hasLowercase,
    @Default(false) bool hasUppercase,
    @Default(false) bool hasSpecialCharacters,
    @Default(false) bool hasNumber,
    @Default(false) bool hasMinLength,
    @Default(AutovalidateMode.disabled) AutovalidateMode autoValidateMode,
  }) = _AuthFormState;
}
