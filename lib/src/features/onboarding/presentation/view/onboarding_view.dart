import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:docdoc/src/core/helpers/extensions.dart';

import '../../../../config/router/routes.dart';
import '../../../../config/themes/app_text_styles.dart';
import '../../../../core/helpers/cache_keys.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/my_sized_box.dart';
import '../../../../core/widgets/primary_button.dart';
import 'widgets/app_logo_and_name.dart';
import 'widgets/doctor_and_onboarding_title.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 30.h),
            child: Column(
              children: <Widget>[
                const AppLogoAndName(),
                MySizedBox.height40,
                const DoctorAndOnboardingTitle(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    spacing: 32.h,
                    children: <Widget>[
                      Text(
                        AppStrings.onboardingDescription,
                        style: AppTextStyles.font14Regular,
                        textAlign: TextAlign.center,
                      ),
                      PrimaryButton(
                        onPressed: () =>
                            _markOnboardingAsVisitedAndGoLogin(context),
                        text: AppStrings.getStarted,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _markOnboardingAsVisitedAndGoLogin(BuildContext context) {
    CacheHelper.setData(CacheKeys.onboarding, true).then((value) {
      if (value) context.pushReplacementNamed(newRoute: Routes.login);
    });
  }
}
