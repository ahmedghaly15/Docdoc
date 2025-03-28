import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/auth_helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailController,
    this.emailFocusNode,
    required this.nextFocusNode,
  });

  final TextEditingController emailController;
  final FocusNode? emailFocusNode;
  final FocusNode nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      focusNode: emailFocusNode,
      hintText: AppStrings.email,
      autofillHints: const <String>[AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      validating: (String? val) => AuthHelper.validatingEmailField(value: val),
      onEditingComplete: () => context.requestFocus(
        nextFocusNode,
      ),
    );
  }
}
