import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/login/login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'form_notifier_providers.dart';

part 'login_provider.g.dart';

final loginFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final loginEmailControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final loginPassControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});

final loginPassFocusNodeProvider = Provider.autoDispose<FocusNode>((ref) {
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
          email: ref.watch(loginEmailControllerProvider).text.trim(),
          password: ref.watch(loginPassControllerProvider).text,
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
      ref.read(loginAutovalidateModeProvider.notifier).enableAutovalidateMode();
    }
  }
}
