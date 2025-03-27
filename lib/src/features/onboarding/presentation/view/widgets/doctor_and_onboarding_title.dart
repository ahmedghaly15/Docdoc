import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';

class DoctorAndOnboardingTitle extends StatelessWidget {
  const DoctorAndOnboardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SvgPicture.asset(AppAssets.svgsLowOpacityLogo),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withAlpha(0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(AppAssets.imagesOnboardingDoctor),
        ),
        Positioned(
          bottom: 10.h,
          right: 0,
          left: 0,
          child: Text(
            AppStrings.onboardingTitle,
            style: AppTextStyles.font32Bold.copyWith(
              color: AppColors.primaryColor,
              height: 1.4.h,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
