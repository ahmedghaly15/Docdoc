import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../core/helpers/auth_helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/fill_profile_provider.dart';

class FillProfileForm extends ConsumerWidget {
  const FillProfileForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(fillProfileFormKeyProvider);
    final autovalidateMode = ref.watch(fillProfileAutovalidateModeProvider);
    final phoneController = ref.watch(fillProfilePhoneControllerProvider);
    final nameController = ref.watch(fillProfileNameControllerProvider);
    final genderController = ref.watch(fillProfileGenderControllerProvider);
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
            validating: (val) => AuthHelper.validatingNameField(val),
            onEditingComplete: () => context.requestFocus(phoneFocusNode),
          ),
          InternationalPhoneNumberInput(
            onInputChanged: (phoneNumber) {},
            textFieldController: phoneController,
            initialValue: PhoneNumber(isoCode: 'EG', dialCode: '20'),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              showFlags: true,
              useEmoji: true,
              trailingSpace: false,
              setSelectorButtonAsPrefixIcon: false,
            ),
            inputDecoration: InputDecoration(
              filled: true,
              fillColor: AppColors.textFormFieldFillColor,
              border: CustomTextFormField.underlineInputBorder(),
              enabledBorder: CustomTextFormField.underlineInputBorder(),
              focusedBorder: CustomTextFormField.underlineInputBorder(),
              errorBorder: CustomTextFormField.underlineInputBorder(),
              focusedErrorBorder: CustomTextFormField.underlineInputBorder(),
              disabledBorder: CustomTextFormField.underlineInputBorder(),
              contentPadding: CustomTextFormField.contentPad,
              hintText: AppStrings.phoneNumber,
              hintStyle: CustomTextFormField.textStyle,
            ),
            focusNode: phoneFocusNode,
            autofillHints: const [AutofillHints.telephoneNumber],
            autoValidateMode: autovalidateMode,
            ignoreBlank: false,
            formatInput: true,
            validator: (value) => AuthHelper.validatePhoneField(value: value),
          ),
          DropdownButtonFormField<String>(
            autovalidateMode: autovalidateMode,
            hint: Text(
              AppStrings.gender,
              style: CustomTextFormField.textStyle,
            ),
            items: const [
              DropdownMenuItem(
                value: AppStrings.male,
                child: Text(AppStrings.male),
              ),
              DropdownMenuItem(
                value: AppStrings.female,
                child: Text(AppStrings.female),
              ),
            ],
            onChanged: (gender) {
              genderController.text = gender ?? AppStrings.male;
            },
            style: CustomTextFormField.textStyle,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.textFormFieldFillColor,
              border: CustomTextFormField.underlineInputBorder(),
              enabledBorder: CustomTextFormField.underlineInputBorder(),
              focusedBorder: CustomTextFormField.underlineInputBorder(),
              errorBorder: CustomTextFormField.underlineInputBorder(),
              focusedErrorBorder: CustomTextFormField.underlineInputBorder(),
              disabledBorder: CustomTextFormField.underlineInputBorder(),
              contentPadding: CustomTextFormField.contentPad,
            ),
          ),
        ],
      ),
    );
  }
}
