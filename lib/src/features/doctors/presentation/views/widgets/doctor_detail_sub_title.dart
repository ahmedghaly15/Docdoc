import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';

class DoctorDetailSubTitle extends StatelessWidget {
  const DoctorDetailSubTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Text(
        text,
        style: AppTextStyles.font14Regular.copyWith(
          color: AppColors.color757575,
        ),
      ),
    );
  }
}
