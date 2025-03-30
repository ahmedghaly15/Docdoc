import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/fill_profile_provider.dart';

class DropdownGenderField extends ConsumerWidget {
  const DropdownGenderField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderController = ref.watch(fillProfileGenderControllerProvider);
    final autovalidateMode = ref.watch(fillProfileAutovalidateModeProvider);
    return DropdownButtonFormField<String>(
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
      style: CustomTextFormField.textStyle.copyWith(color: Colors.black),
      dropdownColor: Colors.white,
      decoration: AppConstants.textFormFieldInputDecoration(),
    );
  }
}
