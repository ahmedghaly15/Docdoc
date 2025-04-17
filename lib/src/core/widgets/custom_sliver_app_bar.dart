import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../config/themes/app_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.titleText,
    this.actions,
    this.titleWidget,
    this.leading,
    this.hasLeading = true,
    this.backgroundColor,
  });

  final String? titleText;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final Widget? leading;
  final bool hasLeading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      title: titleWidget ?? (titleText.isNullOrEmpty ? null : Text(titleText!)),
      leading: hasLeading ? leading ?? const ArrowBackIconButton() : null,
      actions: actions,
    );
  }
}

class ArrowBackIconButton extends StatelessWidget {
  const ArrowBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.colorEDEDED,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.black,
        iconSize: 24.h,
      ),
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }
}
