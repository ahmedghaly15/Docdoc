import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../../config/themes/app_colors.dart';
import '../../../../../config/themes/app_text_styles.dart';
import '../../providers/doctors_providers.dart';

class AppointmentTimePickerConsumer extends ConsumerWidget {
  const AppointmentTimePickerConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedTime = ref.watch(pickedTimeProvider);
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.colorEDEDED,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: () async {
        final selectedTime = await context.showTimePickerDialog(
          initialTime: pickedTime,
        );
        if (selectedTime != null) {
          ref.read(pickedTimeProvider.notifier).state = selectedTime;
        }
      },
      child: Text(
        pickedTime.format(context),
        style: AppTextStyles.font16SemiBold.copyWith(
          color: AppColors.color757575,
        ),
      ),
    );
  }
}
