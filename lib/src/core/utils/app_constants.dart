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

  static double screenHorizontalPadding = 30.w;
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
}
