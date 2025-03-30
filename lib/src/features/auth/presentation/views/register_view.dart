import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/auth_subtitle.dart';
import 'widgets/auth_title.dart';
import 'widgets/password_validations.dart';
import 'widgets/register/already_have_acc.dart';
import 'widgets/register/register_consumer_button.dart';
import 'widgets/register/register_form.dart';
import 'widgets/terms_and_privacy_policy_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                child: AuthTitle(title: AppStrings.createAccount),
              ),
              const SliverToBoxAdapter(
                child: AuthSubTitle(
                  subTitle: AppStrings.registerViewDescription,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 16.h, bottom: 12.h),
                  child: const RegisterForm(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(bottom: 32.h),
                  child: const PasswordValidations(),
                ),
              ),
              const SliverToBoxAdapter(
                child: RegisterConsumerButton(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  spacing: 24.h,
                  children: const <Widget>[
                    Spacer(),
                    TermsAndPrivacyPolicyText(),
                    AlreadyHaveAnAcc(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
