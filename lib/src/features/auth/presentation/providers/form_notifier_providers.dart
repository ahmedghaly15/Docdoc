import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/app_regex.dart';
import 'password_validations_state.dart';

final loginPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ObscureTextNotifier, bool>(
  (ref) => ObscureTextNotifier(),
);
final registerPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ObscureTextNotifier, bool>(
  (ref) => ObscureTextNotifier(),
);
final confirmPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ObscureTextNotifier, bool>(
  (ref) => ObscureTextNotifier(),
);

class ObscureTextNotifier extends StateNotifier<bool> {
  ObscureTextNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final loginAutovalidateModeProvider = StateNotifierProvider.autoDispose<
    AutovalidateModeNotifier, AutovalidateMode>(
  (ref) => AutovalidateModeNotifier(),
);
final registerAutovalidateModeProvider = StateNotifierProvider.autoDispose<
    AutovalidateModeNotifier, AutovalidateMode>(
  (ref) => AutovalidateModeNotifier(),
);

class AutovalidateModeNotifier extends StateNotifier<AutovalidateMode> {
  AutovalidateModeNotifier() : super(AutovalidateMode.disabled);

  void enableAutovalidateMode() {
    state = AutovalidateMode.always;
  }
}

final passValidationsProvider = StateNotifierProvider.autoDispose<
    PasswordValidationsNotifier, PasswordValidationsState>(
  (ref) => PasswordValidationsNotifier(),
);

class PasswordValidationsNotifier
    extends StateNotifier<PasswordValidationsState> {
  PasswordValidationsNotifier() : super(const PasswordValidationsState());

  void validatePassword(String password) {
    state = state.copyWith(
      hasLowercase: AppRegex.hasLowerCase(password),
      hasUppercase: AppRegex.hasUpperCase(password),
      hasSpecialCharacters: AppRegex.hasSpecialCharacter(password),
      hasNumber: AppRegex.hasNumber(password),
      hasMinLength: AppRegex.hasMinLength(password),
    );
  }
}
