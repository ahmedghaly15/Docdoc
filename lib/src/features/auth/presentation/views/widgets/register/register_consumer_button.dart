import 'package:docdoc/src/core/helpers/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../providers/register_provider.dart';

class RegisterConsumerButton extends ConsumerWidget {
  const RegisterConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerProvider, (_, current) => _listener(current, context));
    return PrimaryButton(
      onPressed: () {
        ref.read(registerProvider.notifier).validateAndRegister();
      },
      text: AppStrings.signUp,
    );
  }

  void _listener(AsyncValue<dynamic>? current, BuildContext context) {
    current?.whenOrNull(
      loading: () {
        context.unfocusKeyboard();
        context.showLoadingDialog();
      },
      data: (_) {
        context.pop();
        context.showAnimatedDialog(
          state: CustomDialogStates.success,
          message: AppStrings.registerSuccessMsg,
          actionText: AppStrings.continueWord,
          onAction: () {
            context.pushNamedAndRemoveUntil(newRoute: Routes.homeRoute);
          },
        );
      },
      error: (error, _) {
        context.pop();
        context.showAnimatedDialog(
          state: CustomDialogStates.error,
          message: error.toString(),
        );
      },
    );
  }
}
