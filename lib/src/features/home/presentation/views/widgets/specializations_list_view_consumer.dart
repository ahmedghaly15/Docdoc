import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/custom_skeletonizer.dart';
import '../../../../../core/widgets/my_sized_box.dart';
import '../../../../../core/models/specialization.dart';
import '../../../../../core/widgets/specialization_widget.dart';
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
      itemBuilder: (context, index) =>
          SpecializationWidget(specialization: specializations?[index]),
      separatorBuilder: (_, __) => MySizedBox.width24,
    );
  }
}
