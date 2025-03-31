import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/primary_button.dart';

class FindNearByDoctorBlueContainer extends StatelessWidget {
  const FindNearByDoctorBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: double.infinity,
            padding: EdgeInsets.only(top: 12.h, left: 18.w, bottom: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: const DecorationImage(
                image: AssetImage(
                  AppAssets.imagesHomeBluePattern,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                Text(
                  AppStrings.bookAndSchedule,
                  style: AppTextStyles.font18WhiteMedium,
                ),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {},
                    isExpanded: false,
                    height: 38,
                    backgroundColor: Colors.white,
                    borderRadius: 48,
                    textStyle: AppTextStyles.font12Regular.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    text: AppStrings.findNearBy,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            top: 0,
            child: Image.asset(AppAssets.imagesGirlDoctor, height: 200.h),
          ),
        ],
      ),
    );
  }
}
