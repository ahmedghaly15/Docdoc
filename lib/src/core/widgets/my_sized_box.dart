import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
    );
  }
}

class MySizedBox {
  static const CustomSizedBox height8 = CustomSizedBox(height: 8);
  static const CustomSizedBox height12 = CustomSizedBox(height: 12);
  static const CustomSizedBox height16 = CustomSizedBox(height: 16);
  static const CustomSizedBox height24 = CustomSizedBox(height: 24);
  static const CustomSizedBox height23 = CustomSizedBox(height: 23);
  static const CustomSizedBox width16 = CustomSizedBox(width: 16);
  static const CustomSizedBox height40 = CustomSizedBox(height: 40);
  static const CustomSizedBox height36 = CustomSizedBox(height: 36);
  static const CustomSizedBox height32 = CustomSizedBox(height: 32);
}
