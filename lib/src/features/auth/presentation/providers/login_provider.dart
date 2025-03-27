import 'package:dio/dio.dart';
import 'package:docdoc/src/features/auth/data/models/login/login_request_body.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repos/login_repo.dart';
import 'form_notifier_provider.dart';

part 'login_provider.g.dart';

final loginFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final emailControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final passControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final passFocusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});

@riverpod
class Login extends _$Login {
  @override
  AsyncValue? build() {
    return null;
  }

  void _login() async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    ref.onDispose(() => cancelToken.cancel());
    final result = await ref.read(loginRepoProvider).login(LoginRequestBody(
          email: ref.watch(emailControllerProvider).text.trim(),
          password: ref.watch(passControllerProvider).text,
        ));
    result.when(
      success: (loginResponse) => state = AsyncValue.data(loginResponse),
      failure: (error) => state = AsyncValue.error(
        error.message ?? '',
        StackTrace.empty,
      ),
    );
  }

  void validateAndLogin() {
    final loginFormKey = ref.watch(loginFormKeyProvider);
    if (loginFormKey.currentState!.validate()) {
      _login();
    } else {
      ref.read(formNotifierProvider.notifier).enableAutoValidateMode();
    }
  }
}
