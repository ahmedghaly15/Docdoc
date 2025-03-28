import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../core/helpers/auth_helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.passController,
    required this.passFocusNode,
    required this.obscureText,
    required this.suffixOnPressed,
    this.nextFocusNode,
    this.validating,
    this.hintText = AppStrings.password,
  });

  final TextEditingController passController;
  final FocusNode passFocusNode;
  final bool obscureText;
  final VoidCallback suffixOnPressed;
  final String? Function(String?)? validating;
  final FocusNode? nextFocusNode;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText,
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
        onPressed: suffixOnPressed,
      ),
      validating:
          validating ?? (val) => AuthHelper.validatingPasswordField(value: val),
      onEditingComplete: nextFocusNode != null
          ? () => context.requestFocus(nextFocusNode!)
          : null,
    );
  }
}
