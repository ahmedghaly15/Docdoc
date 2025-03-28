import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/my_sized_box.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AuthTitle(title: AppStrings.createAccount),
                    AuthSubTitle(
                      subTitle: AppStrings.registerViewDescription,
                    ),
                    MySizedBox.height16,
                    RegisterForm(),
                    MySizedBox.height12,
                    PasswordValidations(),
                    MySizedBox.height32,
                    RegisterConsumerButton(),
                  ],
                ),
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
