import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/primary_button.dart';

class SubmitConsumerButton extends ConsumerWidget {
  const SubmitConsumerButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      onPressed: () {},
      text: AppStrings.submit,
    );
  }
}
