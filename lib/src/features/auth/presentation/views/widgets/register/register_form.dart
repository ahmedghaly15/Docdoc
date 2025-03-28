import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/auth_helper.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../providers/form_notifier_providers.dart';
import '../../../providers/register_provider.dart';
import '../email_text_form_field.dart';
import '../password_text_form_field.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passObscureText = ref.watch(registerPassObscureTextProvider);
    final confirmPassObscureText = ref.watch(confirmPassObscureTextProvider);
    final autovalidateMode = ref.watch(registerAutovalidateModeProvider);
    final formKey = ref.watch(registerFormKeyProvider);
    final nameController = ref.watch(registerNameControllerProvider);
    final emailController = ref.watch(registerEmailControllerProvider);
    final passwordController = ref.watch(registerPassControllerProvider);
    final confirmPassController =
        ref.watch(registerConfirmPassControllerProvider);
    final phoneController = ref.watch(registerPhoneNumberControllerProvider);
    final emailFocusNode = ref.watch(registerEmailFocusNodeProvider);
    final passwordFocusNode = ref.watch(registerPassFocusNodeProvider);
    final confirmPassFocusNode =
        ref.watch(registerConfirmPassFocusNodeProvider);
    final phoneFocusNode = ref.watch(registerPhoneNumberFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        children: <Widget>[
          CustomTextFormField(
            hintText: AppStrings.name,
            controller: nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            autofillHints: const <String>[AutofillHints.name],
            validating: (val) => AuthHelper.validatingNameField(val),
            onEditingComplete: () => context.requestFocus(emailFocusNode),
          ),
          EmailTextFormField(
            emailController: emailController,
            emailFocusNode: emailFocusNode,
            nextFocusNode: passwordFocusNode,
          ),
          PasswordTextFormField(
            passController: passwordController,
            passFocusNode: passwordFocusNode,
            nextFocusNode: confirmPassFocusNode,
            obscureText: passObscureText,
            suffixOnPressed: () =>
                ref.read(registerPassObscureTextProvider.notifier).toggle(),
          ),
          PasswordTextFormField(
            hintText: AppStrings.confirmPass,
            passController: confirmPassController,
            passFocusNode: confirmPassFocusNode,
            obscureText: confirmPassObscureText,
            nextFocusNode: phoneFocusNode,
            suffixOnPressed: () =>
                ref.read(confirmPassObscureTextProvider.notifier).toggle(),
            validating: (val) => AuthHelper.validatingConfirmPasswordField(
              password: passwordController.text,
              confirmPassword: val,
            ),
          ),
          CustomTextFormField(
            hintText: AppStrings.phoneNumber,
            controller: phoneController,
            focusNode: phoneFocusNode,
            keyboardType: TextInputType.phone,
            autofillHints: const <String>[AutofillHints.telephoneNumber],
            validating: (String? val) =>
                AuthHelper.validatePhoneField(value: val),
          ),
        ],
      ),
    );
  }
}
