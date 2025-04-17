import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../core/api/api_response.dart';
import '../../../../../../core/api/dio_factory.dart';
import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../../../fill_profile/presentation/providers/fill_profile_provider.dart';
import '../../../providers/login_provider.dart';

class LoginConsumerButton extends ConsumerWidget {
  const LoginConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pass = ref.watch(loginPassControllerProvider).text.trim();
    final email = ref.watch(loginEmailControllerProvider).text.trim();
    ref.listen(loginProvider, (_, next) {
      _listener(
        next: next,
        context: context,
        user: UserModel(email: email, password: pass),
        ref: ref,
      );
    });
    return PrimaryButton(
      onPressed: () {
        ref.read(loginProvider.notifier).validateAndLogin();
      },
      text: AppStrings.signIn,
    );
  }

  void _listener({
    AsyncValue<ApiResponse<UserModel>>? next,
    required BuildContext context,
    required UserModel user,
    required WidgetRef ref,
  }) {
    next?.whenOrNull(
      loading: () {
        context.unfocusKeyboard();
        context.showLoadingDialog();
      },
      data: (loginResponse) async => await _onLoginSuccess(
        context: context,
        loginResponse: loginResponse,
        ref: ref,
        user: user,
      ),
      error: (error, __) {
        context.pop();
        context.showAnimatedDialog(
          state: CustomDialogStates.error,
          message: error.toString(),
        );
      },
    );
  }

  Future<void> _onLoginSuccess({
    required BuildContext context,
    required ApiResponse<UserModel> loginResponse,
    required WidgetRef ref,
    required UserModel user,
  }) async {
    context.pop();
    final userToken = loginResponse.data!.token!;
    DioFactory.setTokenIntoHeaders(userToken);
    final fetchedProfile = await ref.refresh(fetchProfileProvider.future);
    await _cacheUserAndGoHome(
      user.copyWith(
        token: userToken,
        userName: loginResponse.data!.userName!,
        name: fetchedProfile.data!.first.name,
        phone: fetchedProfile.data!.first.phone,
        gender: fetchedProfile.data!.first.gender,
        id: fetchedProfile.data!.first.id,
      ),
      context,
    );
  }

  Future<void> _cacheUserAndGoHome(
    UserModel user,
    BuildContext context,
  ) async {
    await UserModel.secureUser(user);
    context.pushReplacementNamed(newRoute: Routes.home);
  }
}
