import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/my_sized_box.dart';
import 'appointment_time_picker_consumer.dart';
import 'book_appointment_consumer_button.dart';
import 'doctor_detail_title.dart';
import 'notes_form_field_consumer.dart';

class BookAppointmentSheetContent extends StatelessWidget {
  const BookAppointmentSheetContent({
    super.key,
    required this.doctorId,
  });

  final int doctorId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const DoctorDetailTitle(text: AppStrings.startTime),
        const AppointmentTimePickerConsumer(),
        const DoctorDetailTitle(text: AppStrings.notes),
        const NotesFormFieldConsumer(),
        MySizedBox.height16,
        BookAppointmentConsumerButton(doctorId: doctorId)
      ],
    );
  }
}
