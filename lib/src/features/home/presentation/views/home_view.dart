import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/recommended_doctors_sliver_list_consumer.dart';
import '../../../doctors/presentation/providers/doctors_providers.dart';
import '../providers/home_provider.dart';
import 'widgets/find_near_by_doctor_blue_container.dart';
import 'widgets/home_custom_app_bar.dart';
import 'widgets/see_all_row.dart';
import 'widgets/specializations_list_view_consumer.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveRefreshIndicator(
          onRefresh: () async {
            ref.invalidate(fetchHomeSpecializationsProvider);
            ref.invalidate(fetchDoctorsProvider);
          },
          child: Padding(
            padding: AppConstants.screenPadding,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: HomeCustomAppBar()),
                const SliverToBoxAdapter(
                  child: FindNearByDoctorBlueContainer(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 24.h),
                    child: const SeeAllRow(title: AppStrings.doctorSpeciality),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100.h,
                    margin: EdgeInsets.only(top: 16.h, bottom: 23.h),
                    child: const SpecializationsListViewConsumer(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    child: SeeAllRow(
                      title: AppStrings.recommendedDoctors,
                      onTap: () => context.pushNamed(
                          routeName: Routes.recommendedDoctors),
                    ),
                  ),
                ),
                const RecommendedDoctorsSliverListConsumer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
