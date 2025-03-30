import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/router/routes.dart';
import '../../../../../core/api/api_response.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/fill_profile_provider.dart';

class SubmitConsumerButton extends ConsumerWidget {
  const SubmitConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fillProfile = ref.watch(fillProfileProvider);
    ref.listen(fetchProfileProvider,
        (_, current) => _fetchProfileListener(current, context));
    ref.listen(fillProfileProvider,
        (_, current) => _updateProfileListener(current, context));
    return PrimaryButton(
      onPressed: () {
        ref.read(fillProfileProvider.notifier).validateAndUpdateProfile();
      },
      text: AppStrings.submit,
      child: fillProfile?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
    );
  }

  void _fetchProfileListener(
    AsyncValue<ApiResponse<List<UserModel>>> current,
    BuildContext context,
  ) {
    current.whenOrNull(
      error: (error, stackTrace) => context.showAnimatedDialog(
        state: CustomDialogStates.error,
        message: error.toString(),
      ),
      data: (result) => context.showAnimatedDialog(
        state: CustomDialogStates.success,
        message: 'User ${result.data?.first.email} fetched successfully',
      ),
    );
  }

  void _updateProfileListener(
    AsyncValue<ApiResponse<UserModel>>? current,
    BuildContext context,
  ) {
    current?.whenOrNull(
      error: (error, stackTrace) => context.showAnimatedDialog(
        state: CustomDialogStates.error,
        message: error.toString(),
      ),
      data: (result) async {
        await _cacheUserAndGoHome(
          result.data,
          context,
        );
      },
    );
  }

  Future<void> _cacheUserAndGoHome(
    UserModel? userData,
    BuildContext context,
  ) async {
    currentUser = currentUser?.copyWith(
      name: userData?.name,
      phone: userData?.phone,
      gender: userData?.gender,
    );
    await UserModel.secureUser(user: currentUser!);
    context.pushReplacementNamed(newRoute: Routes.home);
  }
}
