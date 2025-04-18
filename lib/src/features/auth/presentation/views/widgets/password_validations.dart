import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../providers/form_notifier_providers.dart';
import '../../providers/register_provider.dart';

class PasswordValidations extends ConsumerStatefulWidget {
  const PasswordValidations({super.key});

  @override
  ConsumerState<PasswordValidations> createState() =>
      _PasswordValidationsState();
}

class _PasswordValidationsState extends ConsumerState<PasswordValidations> {
  @override
  void didChangeDependencies() {
    final passController = ref.watch(registerPassControllerProvider);
    passController.addListener(() {
      ref
          .read(passValidationsProvider.notifier)
          .validatePassword(passController.text);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final passValidations = ref.watch(passValidationsProvider);
    return Column(
      spacing: 2.h,
      children: [
        _buildValidationRow(
          'At least 1 lowercase letter',
          passValidations.hasLowercase,
        ),
        _buildValidationRow(
          'At least 1 uppercase letter',
          passValidations.hasUppercase,
        ),
        _buildValidationRow(
          'At least 1 special character',
          passValidations.hasSpecialCharacters,
        ),
        _buildValidationRow(
          'At least 1 number',
          passValidations.hasNumber,
        ),
        _buildValidationRow(
          'At least 8 characters long',
          passValidations.hasMinLength,
        ),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool hasValidated) {
    return Row(
      spacing: 6.w,
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: AppColors.color757575,
        ),
        Text(
          //'At least 1 lowercase letter',
          text,
          style: AppTextStyles.font13Regular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2.w,
            color: hasValidated ? AppColors.color757575 : AppColors.color242424,
          ),
        ),
      ],
    );
  }
}
