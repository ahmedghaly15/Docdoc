import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_text_styles.dart';
import '../utils/app_strings.dart';
import 'primary_button.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    this.onPressed,
  });

  final String error;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: 64.h,
          color: AppColors.primaryColor,
        ),
        Text(
          error,
          style: AppTextStyles.font15Medium,
          textAlign: TextAlign.center,
        ),
        if (onPressed != null)
          PrimaryButton(
            onPressed: onPressed,
            text: AppStrings.tryAgain,
          ),
      ],
    );
  }
}
