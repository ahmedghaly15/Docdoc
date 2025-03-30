import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/usecases/api_usecase.dart';
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

final fetchProfileProvider =
    FutureProvider<ApiResponse<List<UserModel>>>((ref) async {
  final apiResult =
      await ref.read(fetchUserProfileProvider).call(const NoParams());
  return apiResult.when(
    success: (userProfile) => userProfile,
    failure: (failure) => throw failure.getAllErrorMessages,
  );
});

@riverpod
class FillProfile extends _$FillProfile {
  @override
  AsyncValue<ApiResponse<UserModel>>? build() {
    return null;
  }

  String? phoneNumber;

  void _updateProfile() async {
    state = const AsyncValue.loading();
    final user = await UserModel.getSecuredUser();
    final result = await ref
        .read(updateProfileProvider)
        .call(RegisterRequestBody(
          email: user!.email!,
          password: user.password!,
          name: ref.watch(fillProfileNameControllerProvider).text.trim(),
          phone: phoneNumber,
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
