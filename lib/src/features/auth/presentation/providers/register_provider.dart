import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
final registerNameControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final registerPhoneNumberControllerProvider =
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
final registerPhoneNumberFocusNodeProvider =
    Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final registerPassFocusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final registerConfirmPassFocusNodeProvider =
    Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});

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
    final result = await ref
        .read(registerRepoProvider)
        .register(RegisterRequestBody(
          name: ref.watch(registerNameControllerProvider).text.trim(),
          email: ref.watch(registerEmailControllerProvider).text.trim(),
          phone: ref.watch(registerPhoneNumberControllerProvider).text.trim(),
          password: ref.watch(registerPassControllerProvider).text,
          passwordConfirmation: ref.watch(registerPassControllerProvider).text,
          gender: 0,
        ));
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
