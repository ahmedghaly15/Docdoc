import 'package:docdoc/src/core/helpers/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/api/api_response.dart';
import '../../../../../../core/api/dio_factory.dart';
import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/primary_button.dart';
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
    AsyncValue<ApiResponse<UserModel>>? current,
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
        final userToken = registerResponse.data!.token!;
        context.showAnimatedDialog(
          state: CustomDialogStates.success,
          message: AppStrings.registerSuccessMsg,
          actionText: AppStrings.continueWord,
          onAction: () async {
            DioFactory.setTokenIntoHeaders(userToken);
            await _cacheUserAndGoFillProfile(
              context: context,
              user: user,
            );
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

  Future<void> _cacheUserAndGoFillProfile({
    required BuildContext context,
    required UserModel user,
  }) async {
    await UserModel.secureUser(user);
    context.pushNamedAndRemoveUntil(newRoute: Routes.fillProfile);
  }
}
