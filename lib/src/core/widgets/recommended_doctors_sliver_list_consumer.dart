import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/doctors/presentation/providers/doctors_providers.dart';
import '../models/doctor.dart';
import 'custom_error_widget.dart';
import 'custom_skeletonizer.dart';
import 'doctor_item.dart';
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
        child: DoctorItem(doctor: doctors?[index]),
      ),
      separatorBuilder: (_, __) => MySizedBox.height16,
    );
  }
}
