import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/api/dio_factory.dart';
import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../../data/models/auth_response.dart';
import '../../../providers/login_provider.dart';

class LoginConsumerButton extends ConsumerWidget {
  const LoginConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pass = ref.watch(loginPassControllerProvider).text.trim();
    final email = ref.watch(loginEmailControllerProvider).text.trim();
    ref.listen(
        loginProvider,
        (_, next) => _listener(
              next: next,
              context: context,
              user: UserModel(email: email, password: pass),
            ));
    return PrimaryButton(
      onPressed: () {
        ref.read(loginProvider.notifier).validateAndLogin();
      },
      text: AppStrings.signIn,
    );
  }

  void _listener({
    AsyncValue<AuthResponse>? next,
    required BuildContext context,
    required UserModel user,
  }) {
    next?.whenOrNull(
      loading: () {
        context.unfocusKeyboard();
        context.showLoadingDialog();
      },
      data: (loginResponse) async {
        context.pop();
        final userToken = loginResponse.userData!.token!;
        DioFactory.setTokenIntoHeadersAfterLogin(userToken);
        await _cacheUserAndGoHome(userToken, user, context);
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

  Future<void> _cacheUserAndGoHome(
    String token,
    UserModel user,
    BuildContext context,
  ) async {
    await UserModel.secureUser(
      userToken: token,
      user: user,
    );
    context.pushReplacementNamed(newRoute: Routes.home);
  }
}
