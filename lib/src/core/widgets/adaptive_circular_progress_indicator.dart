import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveCircularProgressIndicator extends StatelessWidget {
  const AdaptiveCircularProgressIndicator({
    super.key,
    this.color = Colors.white,
    this.strokeWidth = 3.5,
    this.backgroundColor,
  });

  final Color color;
  final Color? backgroundColor;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24.h,
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        strokeCap: StrokeCap.butt,
        strokeWidth: strokeWidth.w,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
