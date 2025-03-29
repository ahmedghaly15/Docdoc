import 'package:docdoc/src/core/helpers/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../../data/models/auth_response.dart';
import '../../../providers/register_provider.dart';

class RegisterConsumerButton extends ConsumerWidget {
  const RegisterConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pass = ref.watch(registerPassControllerProvider).text.trim();
    final email = ref.watch(registerEmailControllerProvider).text.trim();
    ref.listen(
        registerProvider,
        (_, current) => _listener(
              current: current,
              context: context,
              user: UserModel(email: email, password: pass),
            ));
    return PrimaryButton(
      onPressed: () {
        ref.read(registerProvider.notifier).validateAndRegister();
      },
      text: AppStrings.signUp,
    );
  }

  void _listener({
    AsyncValue<AuthResponse>? current,
    required BuildContext context,
    required UserModel user,
  }) {
    current?.whenOrNull(
      loading: () {
        context.unfocusKeyboard();
        context.showLoadingDialog();
      },
      data: (registerResponse) {
        context.pop();
        context.showAnimatedDialog(
          state: CustomDialogStates.success,
          message: AppStrings.registerSuccessMsg,
          actionText: AppStrings.continueWord,
          onAction: () async => await _cacheUserAndGoHome(
            userToken: registerResponse.userData!.token!,
            context: context,
            user: user,
          ),
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

  Future<void> _cacheUserAndGoHome({
    required String userToken,
    required BuildContext context,
    required UserModel user,
  }) async {
    await UserModel.secureUser(userToken: userToken, user: user);
    context.pushNamedAndRemoveUntil(newRoute: Routes.home);
  }
}
