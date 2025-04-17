import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../../../core/widgets/recommended_doctors_sliver_list_consumer.dart';
import '../providers/doctors_providers.dart';

class RecommendedDoctorsView extends ConsumerWidget {
  const RecommendedDoctorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveRefreshIndicator(
          onRefresh: () => ref.refresh(fetchDoctorsProvider.future),
          child: Padding(
            padding: AppConstants.screenPadding,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const CustomSliverAppBar(
                  titleText: AppStrings.recommendedDoctors,
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 32.h),
                  sliver: const RecommendedDoctorsSliverListConsumer(
                    itemCount: RecommendedDoctorsCount.all,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
