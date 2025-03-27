import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/app_regex.dart';
import 'auth_form_state.dart';

final formNotifierProvider = StateNotifierProvider<FormNotifier, AuthFormState>(
  (ref) => FormNotifier(),
);

class FormNotifier extends StateNotifier<AuthFormState> {
  FormNotifier() : super(const AuthFormState());

  void toggleObscureText() {
    state = state.copyWith(isObscureText: !state.isObscureText);
  }

  void validatePassword(String password) {
    state = state.copyWith(
      hasLowercase: AppRegex.hasLowerCase(password),
      hasUppercase: AppRegex.hasUpperCase(password),
      hasSpecialCharacters: AppRegex.hasSpecialCharacter(password),
      hasNumber: AppRegex.hasNumber(password),
      hasMinLength: AppRegex.hasMinLength(password),
    );
  }

  void enableAutoValidateMode() {
    state = state.copyWith(autoValidateMode: AutovalidateMode.always);
  }
}
