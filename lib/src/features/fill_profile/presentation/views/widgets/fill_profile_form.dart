import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/auth_helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/fill_profile_provider.dart';
import 'custom_phone_field.dart';
import 'drop_down_gender_field.dart';

class FillProfileForm extends ConsumerWidget {
  const FillProfileForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(fillProfileFormKeyProvider);
    final autovalidateMode = ref.watch(fillProfileAutovalidateModeProvider);
    final nameController = ref.watch(fillProfileNameControllerProvider);
    final phoneFocusNode = ref.watch(fillProfilePhoneFocusNodeProvider);
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextFormField(
            controller: nameController,
            hintText: AppStrings.fullName,
            autofillHints: const <String>[AutofillHints.name],
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validating: (val) => AuthHelper.validatingNameField(val),
            onEditingComplete: () => context.requestFocus(phoneFocusNode),
          ),
          const CustomPhoneField(),
          const DropdownGenderField(),
        ],
      ),
    );
  }
}
