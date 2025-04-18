import 'package:docdoc/src/config/themes/app_colors.dart';
import 'package:docdoc/src/config/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthSubTitle extends StatelessWidget {
  const AuthSubTitle({
    super.key,
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: AppTextStyles.font14Regular.copyWith(
        color: AppColors.color757575,
      ),
    );
  }
}
