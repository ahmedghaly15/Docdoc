import 'package:family_bottom_sheet/family_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_text_styles.dart';
import '../utils/app_strings.dart';
import '../widgets/my_sized_box.dart';

extension AppNavigator on BuildContext {
  Future<dynamic> pushNamed({required String routeName, Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed({
    required String newRoute,
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(this, newRoute, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil({
    required String newRoute,
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      newRoute,
      (Route<dynamic> route) => false, // remove all previous routes
      arguments: arguments,
    );
  }

  void pop() => Navigator.pop(this);
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension RequestFocusOnFocusNode on BuildContext {
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}

extension UnfocusKeyboard on BuildContext {
  void unfocusKeyboard() => FocusScope.of(this).unfocus();
}

enum CustomDialogStates { warning, success, error }

extension ShowCustomAnimatedDialog on BuildContext {
  String _dialogTitle(
    CustomDialogStates state,
  ) {
    String title;
    switch (state) {
      case CustomDialogStates.error:
        title = AppStrings.opps;
        break;
      case CustomDialogStates.warning:
        title = AppStrings.warning;
        break;

      case CustomDialogStates.success:
        title = AppStrings.success;
        break;
    }
    return title;
  }

  void showAnimatedDialog({
    required CustomDialogStates state,
    required String message,
    VoidCallback? onAction,
    String actionText = 'Done',
  }) {
    showGeneralDialog(
      context: this,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, _, __) => const SizedBox.shrink(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation1, animation2, widget) => Material(
        type: MaterialType.transparency,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation1),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(
                  right: 16.w,
                  left: 16.w,
                  top: 24.h,
                  bottom: 8.h,
                ),
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.r)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      _dialogTitle(state),
                      style: AppTextStyles.font18BoldDarkBlue,
                    ),
                    MySizedBox.height8,
                    Flexible(
                      child: Text(
                        message,
                        style: AppTextStyles.font14Regular.copyWith(
                          color: AppColors.color242424,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MySizedBox.height16,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: onAction ?? () => context.pop(),
                        child: Text(
                          actionText,
                          style: AppTextStyles.font16SemiBold.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension ShowLoadingDialog on BuildContext {
  void showLoadingDialog() {
    showAdaptiveDialog(
      context: this,
      barrierDismissible: false,
      builder: (_) => const _LoadingWidget(),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  // ignore: unused_element_parameter
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80.h,
        width: 80.h,
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 5.w,
        ),
      ),
    );
  }
}

extension ShowModalBottomSheet on BuildContext {
  Future<void> showModalBottomSheet({
    required Widget Function(BuildContext) builder,
  }) async {
    await FamilyModalSheet.show<void>(
      context: this,
      mainContentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      contentBackgroundColor: Colors.white,
      builder: builder,
    );
  }
}

extension ShowTimePicker on BuildContext {
  Future<TimeOfDay?> showTimePickerDialog({
    required TimeOfDay initialTime,
  }) async {
    return await showTimePicker(
      context: this,
      initialTime: initialTime,
      helpText: AppStrings.selectTime,
    );
  }
}
