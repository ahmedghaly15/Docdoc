import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../config/router/routes.dart';
import '../../config/themes/app_text_styles.dart';
import '../models/doctor.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
    this.doctor,
  });

  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => context.pushNamed(
        routeName: Routes.doctorDetails,
        arguments: doctor,
      ),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        spacing: 16.w,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: Skeleton.leaf(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?t=st=1744886153~exp=1744889753~hmac=307ac7c212d04de889b9fe13c9b420ef96a1c85d0f6e26d6d083b686640d4cba&w=1380',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dr. ${doctor?.name ?? 'Doctor name'}',
                  style: AppTextStyles.font16DarkBlueBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${doctor?.specialization.name} | ${doctor?.address}',
                  style: AppTextStyles.font12GreyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
