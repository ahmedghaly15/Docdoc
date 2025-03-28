import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../providers/login_provider.dart';

class LoginConsumerButton extends ConsumerWidget {
  const LoginConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (_, next) => _listener(next, context));
    return PrimaryButton(
      onPressed: () {
        ref.read(loginProvider.notifier).validateAndLogin();
      },
      text: AppStrings.signIn,
    );
  }

  void _listener(AsyncValue<dynamic>? next, BuildContext context) {
    next?.whenOrNull(
      loading: () {
        context.unfocusKeyboard();
        context.showLoadingDialog();
      },
      data: (_) {
        context.pop();
        context.pushReplacementNamed(
          newRoute: Routes.homeRoute,
        );
      },
      error: (error, __) {
        context.pop();
        context.showAnimatedDialog(
          state: CustomDialogStates.error,
          message: error.toString(),
        );
      },
    );
  }
}
