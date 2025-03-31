import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppStrings.hi}, ${currentUser?.name}!',
              style: AppTextStyles.font18BoldDarkBlue,
            ),
            Text(
              AppStrings.howAreYouToday,
              style: AppTextStyles.font12Color616161Regular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.colorF5F5F5,
          child: SvgPicture.asset(AppAssets.svgsNotificationsIcon),
        ),
      ],
    );
  }
}
