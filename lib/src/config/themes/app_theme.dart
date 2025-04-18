import 'package:docdoc/src/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_strings.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        fontFamily: AppStrings.fontFamily,
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightModeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightModeColor,
          titleTextStyle: AppTextStyles.font18SemiBoldDarkBlue,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.lightModeColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(
              AppColors.primaryColor,
            ),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const WidgetStatePropertyAll(Size.zero),
          ),
        ),
      );
}
