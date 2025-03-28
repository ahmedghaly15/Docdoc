import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
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
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.screenHorizontalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: AuthTitle(title: AppStrings.welcomeBack),
              ),
              const SliverToBoxAdapter(
                child: AuthSubTitle(
                  subTitle: AppStrings.loginViewSubTitle,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 36.h, bottom: 32.h),
                  child: const LoginForm(),
                ),
              ),
              const SliverToBoxAdapter(
                child: LoginConsumerButton(),
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
