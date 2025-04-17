import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/models/user_model.dart';
import '../../data/models/login_request_body.dart';
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

final loginPassObscureTextProvider =
    StateNotifierProvider.autoDispose<ObscureTextNotifier, bool>(
  (ref) => ObscureTextNotifier(),
);

@riverpod
class Login extends _$Login {
  @override
  AsyncValue<ApiResponse<UserModel>>? build() {
    return null;
  }

  void _login() async {
    state = const AsyncValue.loading();
    final cancelToken = CancelToken();
    ref.onDispose(() => cancelToken.cancel());
    final result = await ref.read(loginRepoProvider).login(
          LoginRequestBody(
            email: ref.watch(loginEmailControllerProvider).text.trim(),
            password: ref.watch(loginPassControllerProvider).text,
          ),
          cancelToken,
        );
    result.when(
      success: (loginResponse) => state = AsyncValue.data(loginResponse),
      failure: (error) => state = AsyncValue.error(
        error.getAllErrorMessages,
        StackTrace.current,
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
