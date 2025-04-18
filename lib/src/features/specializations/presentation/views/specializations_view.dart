import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/adaptive_refresh_indicator.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../providers/specializations_providers.dart';
import 'widgets/specializations_sliver_grid_consumer.dart';

class SpecializationsView extends ConsumerWidget {
  const SpecializationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: AdaptiveRefreshIndicator(
          onRefresh: () => ref.refresh(fetchSpecializationsProvider.future),
          child: Padding(
            padding: AppConstants.screenPadding,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const CustomSliverAppBar(titleText: AppStrings.specializations),
                SliverPadding(
                  padding: EdgeInsets.only(top: 42.h),
                  sliver: const SpecializationsSliverGridConsumer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
