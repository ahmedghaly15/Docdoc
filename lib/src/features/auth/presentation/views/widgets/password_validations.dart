import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:docdoc/src/config/themes/app_colors.dart';
import 'package:docdoc/src/config/themes/app_text_styles.dart';
import 'package:docdoc/src/features/auth/presentation/providers/form_notifier_provider.dart';

import '../../providers/login_provider.dart';

class PasswordValidations extends ConsumerStatefulWidget {
  const PasswordValidations({super.key});

  @override
  ConsumerState<PasswordValidations> createState() =>
      _PasswordValidationsState();
}

class _PasswordValidationsState extends ConsumerState<PasswordValidations> {
  @override
  void didChangeDependencies() {
    final passController = ref.watch(passControllerProvider);
    passController.addListener(() {
      ref
          .read(formNotifierProvider.notifier)
          .validatePassword(passController.text);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formNotifierProvider);
    return Column(
      spacing: 2.h,
      children: [
        _buildValidationRow(
          'At least 1 lowercase letter',
          formState.hasLowercase,
        ),
        _buildValidationRow(
          'At least 1 uppercase letter',
          formState.hasUppercase,
        ),
        _buildValidationRow(
          'At least 1 special character',
          formState.hasSpecialCharacters,
        ),
        _buildValidationRow(
          'At least 1 number',
          formState.hasNumber,
        ),
        _buildValidationRow(
          'At least 8 characters long',
          formState.hasMinLength,
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
          backgroundColor: AppColors.grey,
        ),
        Text(
          //'At least 1 lowercase letter',
          text,
          style: AppTextStyles.font13Regular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2.w,
            color: hasValidated ? AppColors.grey : AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
