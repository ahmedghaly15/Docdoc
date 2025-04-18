import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_text_styles.dart';

class DoctorDetailTitle extends StatelessWidget {
  const DoctorDetailTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Text(
        text,
        style: AppTextStyles.font16SemiBold,
      ),
    );
  }
}
