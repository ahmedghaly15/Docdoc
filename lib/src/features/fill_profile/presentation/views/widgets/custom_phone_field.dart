import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../core/helpers/auth_helper.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../providers/fill_profile_provider.dart';

class CustomPhoneField extends ConsumerWidget {
  const CustomPhoneField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autovalidateMode = ref.watch(fillProfileAutovalidateModeProvider);
    final phoneFocusNode = ref.watch(fillProfilePhoneFocusNodeProvider);
    return InternationalPhoneNumberInput(
      onInputChanged: (phoneNumber) {
        ref.read(fillProfileProvider.notifier).phoneNumber =
            phoneNumber.phoneNumber!;
      },
      initialValue: PhoneNumber(isoCode: 'EG', dialCode: '20'),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        showFlags: true,
        useEmoji: true,
        trailingSpace: false,
        setSelectorButtonAsPrefixIcon: false,
      ),
      inputDecoration: AppConstants.textFormFieldInputDecoration(
          hintText: AppStrings.phoneNumber),
      focusNode: phoneFocusNode,
      autofillHints: const [AutofillHints.telephoneNumber],
      autoValidateMode: autovalidateMode,
      ignoreBlank: true,
      formatInput: true,
      validator: (_) {
        final phone = ref.watch(fillProfileProvider.notifier).phoneNumber;
        return AuthHelper.validateEgPhoneField(value: phone);
      },
    );
  }
}
