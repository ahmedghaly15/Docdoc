import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/themes/app_colors.dart';
import '../models/user_model.dart';
import '../widgets/custom_text_form_field.dart';

bool isUserLoggedIn = false;
bool isOnboardingVisited = false;
UserModel? currentUser;

class AppConstants {
  AppConstants._();

  static InputDecoration textFormFieldInputDecoration({String? hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.textFormFieldFillColor,
      border: CustomTextFormField.underlineInputBorder(),
      enabledBorder: CustomTextFormField.underlineInputBorder(),
      focusedBorder: CustomTextFormField.underlineInputBorder(
        borderColor: AppColors.primaryColor,
        width: 2,
      ),
      errorBorder: CustomTextFormField.underlineInputBorder(
        borderColor: Colors.red,
        width: 1.3,
      ),
      focusedErrorBorder: CustomTextFormField.underlineInputBorder(
        borderColor: Colors.red,
        width: 1.3,
      ),
      disabledBorder: CustomTextFormField.underlineInputBorder(),
      contentPadding: CustomTextFormField.contentPad,
      hintText: hintText,
      hintStyle: CustomTextFormField.textStyle,
    );
  }

  static EdgeInsetsGeometry get screenPadding =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);

  static ButtonStyle get iconButtonStyle => IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.colorEDEDED,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.black,
        iconSize: 24.h,
      );
}
