import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../config/themes/app_text_styles.dart';
import '../../features/doctors/presentation/providers/doctors_providers.dart';
import '../models/doctor.dart';
import 'custom_error_widget.dart';
import 'custom_skeletonizer.dart';
import 'my_sized_box.dart';

enum RecommendedDoctorsCount {
  just10,
  all,
}

class RecommendedDoctorsSliverListConsumer extends ConsumerWidget {
  const RecommendedDoctorsSliverListConsumer({
    super.key,
    this.itemCount = RecommendedDoctorsCount.just10,
  });

  final RecommendedDoctorsCount itemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedDoctors = ref.watch(fetchDoctorsProvider);
    return recommendedDoctors.when(
      data: (response) => RecommendedDoctorsSliverList(
        doctors: response.data,
        itemCount: switch (itemCount) {
          RecommendedDoctorsCount.just10 => 10,
          RecommendedDoctorsCount.all => response.data!.length,
        },
      ),
      error: (error, _) => SliverFillRemaining(
        hasScrollBody: false,
        child: CustomErrorWidget(
          error: error.toString(),
          onPressed: () => ref.refresh(fetchDoctorsProvider.future),
        ),
      ),
      loading: () => const CustomSkeletonizer(
        type: CustomSkeletonizerType.sliver,
        child: RecommendedDoctorsSliverList(
          itemCount: 10,
        ),
      ),
    );
  }
}

class RecommendedDoctorsSliverList extends StatelessWidget {
  const RecommendedDoctorsSliverList({
    super.key,
    this.doctors,
    this.itemCount,
  });

  final List<Doctor>? doctors;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: itemCount,
      itemBuilder: (_, index) => SizedBox(
        height: 126.h,
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
                    doctors?[index].name ?? 'Doctor name',
                    style: AppTextStyles.font16DarkBlueBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${doctors?[index].specialization.name} | ${doctors?[index].address}',
                    style: AppTextStyles.font12GreyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (_, __) => MySizedBox.height16,
    );
  }
}
