import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/api_usecase.dart';
import '../../../auth/data/models/auth_response.dart';
import '../../../auth/data/models/register_request_body.dart';
import '../../../auth/presentation/providers/form_notifier_providers.dart';
import '../../domain/usecases/fetch_user_profile.dart';
import '../../domain/usecases/update_profile.dart';

part 'fill_profile_provider.g.dart';

final fillProfileFormKeyProvider =
    Provider.autoDispose<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});
final fillProfileNameControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final fillProfilePhoneControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final fillProfileGenderControllerProvider =
    Provider.autoDispose<TextEditingController>((ref) {
  return TextEditingController();
});
final fillProfilePhoneFocusNodeProvider =
    Provider.autoDispose<FocusNode>((ref) {
  return FocusNode();
});
final fillProfileAutovalidateModeProvider = StateNotifierProvider.autoDispose<
    AutovalidateModeNotifier, AutovalidateMode>(
  (ref) => AutovalidateModeNotifier(),
);

@riverpod
class FillProfile extends _$FillProfile {
  @override
  AsyncValue<AuthResponse>? build() {
    _fetchProfile();
    return null;
  }

  void _fetchProfile() async {
    state = const AsyncValue.loading();
    final result =
        await ref.read(fetchUserProfileProvider).call(const NoParams());
    result.when(
      success: (userProfile) => state = AsyncValue.data(userProfile),
      failure: (error) => state = AsyncValue.error(
        error.message ?? '',
        StackTrace.empty,
      ),
    );
  }

  void _updateProfile() async {
    state = const AsyncValue.loading();
    final user = await UserModel.getSecuredUser();
    final result = await ref
        .read(updateProfileProvider)
        .call(RegisterRequestBody(
          email: user!.email!,
          password: user.password!,
          name: ref.watch(fillProfileNameControllerProvider).text.trim(),
          phone: ref.watch(fillProfilePhoneControllerProvider).text.trim(),
          gender: ref.watch(fillProfileGenderControllerProvider).text.trim(),
        ));
    result.when(
      success: (userProfile) => state = AsyncValue.data(userProfile),
      failure: (error) => state = AsyncValue.error(
        error.getAllErrorMessages,
        StackTrace.empty,
      ),
    );
  }

  void validateAndUpdateProfile() {
    final formKey = ref.watch(fillProfileFormKeyProvider);
    if (formKey.currentState!.validate()) {
      _updateProfile();
    } else {
      ref
          .read(fillProfileAutovalidateModeProvider.notifier)
          .enableAutovalidateMode();
    }
  }
}
