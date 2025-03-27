import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/my_sized_box.dart';
import 'widgets/auth_subtitle.dart';
import 'widgets/auth_title.dart';
import 'widgets/login/dont_have_acc.dart';
import 'widgets/login/login_consumer_button.dart';
import 'widgets/login/login_form.dart';
import 'widgets/terms_and_privacy_policy_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AuthTitle(title: AppStrings.welcomeBack),
                    AuthSubTitle(
                      subTitle: AppStrings.loginViewSubTitle,
                    ),
                    MySizedBox.height36,
                    LoginForm(),
                    MySizedBox.height32,
                    LoginConsumerButton(),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    spacing: 24.h,
                    children: const <Widget>[
                      Spacer(),
                      TermsAndPrivacyPolicyText(),
                      DontHaveAcc(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
