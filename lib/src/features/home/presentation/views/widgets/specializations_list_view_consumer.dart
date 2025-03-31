import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/custom_skeletonizer.dart';
import '../../../../../core/widgets/my_sized_box.dart';
import '../../../data/models/specialization.dart';
import '../../providers/home_provider.dart';

class SpecializationsListViewConsumer extends ConsumerWidget {
  const SpecializationsListViewConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specializationsApiResponse =
        ref.watch(fetchHomeSpecializationsProvider);
    return specializationsApiResponse.when(
      data: (apiResult) => SpecializationsListView(
        specializations: apiResult.data,
      ),
      error: (error, _) => Text(error.toString(), textAlign: TextAlign.center),
      loading: () => const CustomSkeletonizer(
        child: SpecializationsListView(),
      ),
    );
  }
}

class SpecializationsListView extends StatelessWidget {
  final List<Specialization>? specializations;

  const SpecializationsListView({super.key, this.specializations});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: specializations?.length ?? 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Column(
        spacing: 12.h,
        children: [
          Skeleton.leaf(
            child: CircleAvatar(
              radius: 28.r,
              backgroundColor: AppColors.colorF4F8FF,
              child: SvgPicture.asset(
                AppAssets.svgsGeneralSpeciality,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
          Text(
            specializations?[index].name ?? 'specializations',
            style: AppTextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
      separatorBuilder: (_, __) => MySizedBox.width24,
    );
  }
}
