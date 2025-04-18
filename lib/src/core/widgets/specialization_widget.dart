import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_text_styles.dart';
import '../models/specialization.dart';
import '../utils/app_assets.dart';

class SpecializationWidget extends StatelessWidget {
  const SpecializationWidget({
    super.key,
    required this.specialization,
  });

  final Specialization? specialization;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        Skeleton.leaf(
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.colorF4F8FF,
            child: SvgPicture.asset(
              AppAssets.svgsGeneralSpeciality,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        Text(
          specialization?.name ?? 'specializations',
          style: AppTextStyles.font12DarkBlueRegular,
        ),
      ],
    );
  }
}
