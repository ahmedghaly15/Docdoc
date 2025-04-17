import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum CustomSkeletonizerType { sliver, normal }

class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer({
    super.key,
    this.enabled = true,
    required this.child,
    this.type = CustomSkeletonizerType.normal,
  });

  final bool enabled;
  final Widget child;
  final CustomSkeletonizerType type;

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey.shade300;
    final highlightColor = Colors.grey.shade100;
    const textBoneBorderRadius = TextBoneBorderRadius.fromHeightFactor(0.5);
    const duration = Duration(seconds: 1);
    const justifyMultiLineText = true;

    switch (type) {
      case CustomSkeletonizerType.sliver:
        return SliverSkeletonizer(
          enabled: enabled,
          effect: ShimmerEffect(
            baseColor: baseColor,
            highlightColor: highlightColor,
            duration: duration,
          ),
          justifyMultiLineText: justifyMultiLineText,
          textBoneBorderRadius: textBoneBorderRadius,
          child: child,
        );
      default:
        return Skeletonizer(
          enabled: enabled,
          effect: ShimmerEffect(
            baseColor: baseColor,
            highlightColor: highlightColor,
            duration: duration,
          ),
          justifyMultiLineText: justifyMultiLineText,
          textBoneBorderRadius: textBoneBorderRadius,
          child: child,
        );
    }
  }
}
