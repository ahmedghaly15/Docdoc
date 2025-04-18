import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../providers/doctors_providers.dart';

class NotesFormFieldConsumer extends ConsumerWidget {
  const NotesFormFieldConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesController = ref.read(notesControllerProvider);
    return CustomTextFormField(
      controller: notesController,
      hintText: AppStrings.notes,
      maxLines: null,
      minLines: 3,
      borderRadius: 10,
    );
  }
}
