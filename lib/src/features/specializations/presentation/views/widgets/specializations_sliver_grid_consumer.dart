import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/specialization.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_skeletonizer.dart';
import '../../../../../core/widgets/specialization_widget.dart';
import '../../providers/specializations_providers.dart';

class SpecializationsSliverGridConsumer extends ConsumerWidget {
  const SpecializationsSliverGridConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specializations = ref.watch(fetchSpecializationsProvider);
    return specializations.when(
      data: (data) => SpecializationsSliverGrid(
        specializations: data.data,
      ),
      error: (error, _) => SliverFillRemaining(
        hasScrollBody: false,
        child: CustomErrorWidget(
          error: error.toString(),
          onPressed: () => ref.refresh(fetchSpecializationsProvider),
        ),
      ),
      loading: () => const CustomSkeletonizer(
        type: CustomSkeletonizerType.sliver,
        child: SpecializationsSliverGrid(),
      ),
    );
  }
}

class SpecializationsSliverGrid extends StatelessWidget {
  const SpecializationsSliverGrid({super.key, this.specializations});

  final List<Specialization>? specializations;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: specializations?.length ?? 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 80 / 117,
        crossAxisCount: 3,
        mainAxisSpacing: 32.h,
        crossAxisSpacing: 36.w,
      ),
      itemBuilder: (_, index) => SpecializationWidget(
        specialization: specializations?[index],
      ),
    );
  }
}
