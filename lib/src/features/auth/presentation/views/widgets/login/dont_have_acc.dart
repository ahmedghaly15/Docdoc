import 'package:flutter/material.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../../../config/router/routes.dart';
import '../../../../../../config/themes/app_colors.dart';
import '../../../../../../config/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_strings.dart';

class DontHaveAcc extends StatelessWidget {
  const DontHaveAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.dontHavAcc,
          style: AppTextStyles.font12SemiBold.copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        TextButton(
          onPressed: () => context.pushNamed(routeName: Routes.register),
          child: const Text(AppStrings.signUp),
        ),
      ],
    );
  }
}
