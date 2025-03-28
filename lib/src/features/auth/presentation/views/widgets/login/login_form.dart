import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/themes/app_colors.dart';
import '../../../../../../core/helpers/auth_helper.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../providers/form_notifier_providers.dart';
import '../../../providers/login_provider.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(obscureTextProvider);
    final autovalidateMode = ref.watch(autovalidateModeProvider);
    final formKey = ref.watch(loginFormKeyProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passController = ref.watch(passControllerProvider);
    final passFocusNode = ref.read(passFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        children: <Widget>[
          CustomTextFormField(
            hintText: AppStrings.email,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const <String>[AutofillHints.email],
            validating: (val) => AuthHelper.validatingEmailField(value: val),
            onEditingComplete: () => context.requestFocus(passFocusNode),
          ),
          CustomTextFormField(
            hintText: AppStrings.password,
            controller: passController,
            focusNode: passFocusNode,
            obscureText: obscureText,
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const <String>[AutofillHints.password],
            suffix: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.hintColor,
              ),
              onPressed: () => ref.read(obscureTextProvider.notifier).toggle(),
            ),
            validating: (val) => AuthHelper.validatingPasswordField(value: val),
          ),
        ],
      ),
    );
  }
}
