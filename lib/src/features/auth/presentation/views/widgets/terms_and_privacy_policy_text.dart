import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';

class TermsAndPrivacyPolicyText extends StatelessWidget {
  const TermsAndPrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "${AppStrings.byLoggingYouAgree} ",
            style:
                AppTextStyles.font12Medium.copyWith(color: AppColors.darkGrey),
          ),
          TextSpan(
            text: AppStrings.termsAndConditions,
            style: AppTextStyles.font12Medium
                .copyWith(color: AppColors.color242424),
          ),
          TextSpan(
            text: ' ${AppStrings.and} ',
            style:
                AppTextStyles.font12Medium.copyWith(color: AppColors.darkGrey),
          ),
          TextSpan(
            text: AppStrings.privacyPolicy,
            style: AppTextStyles.font12Medium.copyWith(
              color: AppColors.color242424,
              height: 1.5.h,
            ),
          ),
        ],
      ),
    );
  }
}
