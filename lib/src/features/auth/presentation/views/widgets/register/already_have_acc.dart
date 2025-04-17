import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/themes/app_colors.dart';
import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_strings.dart';

class AlreadyHaveAnAcc extends StatelessWidget {
  const AlreadyHaveAnAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.alreadyHaveAcc,
          style: AppTextStyles.font12SemiBold.copyWith(
            color: AppColors.color242424,
          ),
        ),
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(AppStrings.signIn),
        )
      ],
    );
  }
}
