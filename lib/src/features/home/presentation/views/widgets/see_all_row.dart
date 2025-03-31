import 'package:flutter/material.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.font18SemiBoldDarkBlue,
        ),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            textStyle: AppTextStyles.font12Regular,
          ),
          child: const Text(AppStrings.seeAll),
        ),
      ],
    );
  }
}
