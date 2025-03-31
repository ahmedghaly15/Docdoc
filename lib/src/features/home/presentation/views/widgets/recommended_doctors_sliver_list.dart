import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/widgets/my_sized_box.dart';

class RecommendedDoctorsSliverList extends StatelessWidget {
  const RecommendedDoctorsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (_, index) => Row(
        spacing: 16.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl:
                  'https://w0.peakpx.com/wallpaper/875/324/HD-wallpaper-sasuke-uchiha-naruto-sasuke-uchiha.jpg',
              height: 110.h,
              width: 110.w,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Doctor name',
                  style: AppTextStyles.font16DarkBlueBold,
                ),
                Text(
                  'General | RSUD Gatot Subroto',
                  style: AppTextStyles.font12GreyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      separatorBuilder: (_, __) => MySizedBox.height16,
    );
  }
}
