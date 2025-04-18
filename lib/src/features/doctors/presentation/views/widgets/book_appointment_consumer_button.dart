import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../appointment/data/models/store_appointment_request_body.dart';
import '../../../../appointment/presentation/providers/appointment_provider.dart';
import '../../providers/doctors_providers.dart';

class BookAppointmentConsumerButton extends ConsumerWidget {
  const BookAppointmentConsumerButton({
    super.key,
    required this.doctorId,
  });

  final int doctorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(appointmentProvider);
    final notesController = ref.watch(notesControllerProvider);
    final pickedTime = ref.watch(pickedTimeProvider);
    _listener(ref, context);
    return PrimaryButton(
      text: AppStrings.makeAnAppointment,
      child: appointment?.whenOrNull(
        loading: () => const AdaptiveCircularProgressIndicator(),
      ),
      onPressed: () =>
          _storeAppointment(pickedTime, ref, context, notesController),
    );
  }

  void _storeAppointment(
    TimeOfDay pickedTime,
    WidgetRef ref,
    BuildContext context,
    TextEditingController notesController,
  ) {
    if (pickedTime != TimeOfDay.now()) {
      ref
          .read(appointmentProvider.notifier)
          .storeAppointment(StoreAppointmentRequestBody(
            doctorId: doctorId,
            startTime: pickedTime.format(context),
            notes: notesController.text.isEmpty ? '' : notesController.text,
          ));
    } else {
      context.showAnimatedDialog(
        state: CustomDialogStates.error,
        message: AppStrings.startTimeAppointmentError,
      );
    }
  }

  void _listener(WidgetRef ref, BuildContext context) {
    ref.listen(appointmentProvider, (_, current) {
      current?.whenOrNull(
        loading: () => context.unfocusKeyboard(),
        data: (_) {
          context.pop();
          context.showAnimatedDialog(
            state: CustomDialogStates.success,
            message: AppStrings.appointmentBookedSuccessfully,
          );
        },
        error: (error, _) => context.showAnimatedDialog(
          state: CustomDialogStates.error,
          message: error.toString(),
        ),
      );
    });
  }
}
