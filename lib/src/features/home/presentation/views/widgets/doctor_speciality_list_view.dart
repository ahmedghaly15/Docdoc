import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/my_sized_box.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => Column(
        spacing: 12.h,
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.primaryColor,
            child: SvgPicture.asset(
              AppAssets.svgsGeneralSpeciality,
              height: 24.h,
              width: 24.w,
            ),
          ),
          Text(
            'Speciality',
            style: AppTextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
      separatorBuilder: (_, __) => MySizedBox.width24,
    );
  }
}
