import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/register_request_body.dart';
import '../../data/repos/register_repo.dart';
import 'form_notifier_providers.dart';

part 'register_provider.g.dart';

final registerFormKeyProvider =
    Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});
final registerEmailControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final registerPassControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final registerConfirmPassControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final registerEmailFocusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final registerPassFocusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final registerConfirmPassFocusNodeProvider =
    Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final registerPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ObscureTextNotifier, bool>(
  (ref) => ObscureTextNotifier(),
);
final confirmPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ObscureTextNotifier, bool>(
  (ref) => ObscureTextNotifier(),
);

@riverpod
class Register extends _$Register {
  @override
  AsyncValue? build() {
    return null;
  }

  void _register() async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    ref.onDispose(() => cancelToken.cancel());
    final result = await ref.read(registerRepoProvider).register(
          RegisterRequestBody(
            email: ref.watch(registerEmailControllerProvider).text.trim(),
            password: ref.watch(registerPassControllerProvider).text,
            passwordConfirmation:
                ref.watch(registerPassControllerProvider).text,
          ),
          cancelToken,
        );
    result.when(
      success: (registerResponse) => state = AsyncValue.data(registerResponse),
      failure: (error) => state = AsyncValue.error(
        error.message ?? '',
        StackTrace.empty,
      ),
    );
  }

  void validateAndRegister() {
    final registerFormKey = ref.watch(registerFormKeyProvider);
    if (registerFormKey.currentState!.validate()) {
      _register();
    } else {
      ref.read(loginAutovalidateModeProvider.notifier).enableAutovalidateMode();
    }
  }
}
