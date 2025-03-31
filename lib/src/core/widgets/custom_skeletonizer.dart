import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizer extends StatelessWidget {
  const CustomSkeletonizer({
    super.key,
    this.enabled = true,
    required this.child,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      justifyMultiLineText: true,
      textBoneBorderRadius: const TextBoneBorderRadius.fromHeightFactor(0.5),
      child: child,
    );
  }
}
