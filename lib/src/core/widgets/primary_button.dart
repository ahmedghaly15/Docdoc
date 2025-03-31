import 'package:docdoc/src/config/themes/app_colors.dart';
import 'package:docdoc/src/config/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.text,
    this.borderRadius,
    this.textStyle,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.child,
    this.width,
    this.height,
    this.isExpanded = true,
    this.padding,
  });

  final String? text;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final double? width;
  final double? height;
  final bool isExpanded;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : width?.w,
      height: height?.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius:
            BorderRadiusDirectional.circular((borderRadius?.r) ?? 16.0.r),
        boxShadow: boxShadow,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.w,
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: height == null
            ? (padding ?? EdgeInsets.symmetric(vertical: 14.h))
            : null,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadiusDirectional.circular((borderRadius?.r) ?? 16.0.r),
        ),
        child: child ??
            Text(
              text!,
              style: textStyle ??
                  AppTextStyles.font16SemiBold.copyWith(
                    color: textColor ?? Colors.white,
                  ),
            ),
      ),
    );
  }
}
