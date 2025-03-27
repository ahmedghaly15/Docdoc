import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/themes/app_colors.dart';
import '../../../../../../core/helpers/auth_helper.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../providers/form_notifier_provider.dart';
import '../../../providers/login_provider.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(formNotifierProvider);
    final formNotifier = ref.read(formNotifierProvider.notifier);
    final formKey = ref.watch(loginFormKeyProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passController = ref.watch(passControllerProvider);
    final passFocusNode = ref.read(passFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: formState.autoValidateMode,
      child: Column(
        spacing: 16.h,
        children: <Widget>[
          CustomTextFormField(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const <String>[AutofillHints.email],
            validating: (val) => AuthHelper.validatingEmailField(value: val),
            onEditingComplete: () => context.requestFocus(passFocusNode),
          ),
          CustomTextFormField(
            hintText: 'Password',
            controller: passController,
            focusNode: passFocusNode,
            obscureText: formState.isObscureText,
            keyboardType: TextInputType.visiblePassword,
            autofillHints: const <String>[AutofillHints.password],
            suffix: IconButton(
              icon: Icon(
                formState.isObscureText
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.hintColor,
              ),
              onPressed: formNotifier.toggleObscureText,
            ),
            validating: (val) => AuthHelper.validatingPasswordField(value: val),
          ),
        ],
      ),
    );
  }
}
