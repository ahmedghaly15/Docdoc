import 'package:flutter/material.dart';

import '../../config/themes/app_colors.dart';

class AdaptiveRefreshIndicator extends StatelessWidget {
  const AdaptiveRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      color: AppColors.primaryColor,
      backgroundColor: AppColors.lightModeColor,
      child: child,
    );
  }
}
