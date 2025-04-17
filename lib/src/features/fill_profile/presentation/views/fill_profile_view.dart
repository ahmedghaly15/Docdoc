import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../auth/presentation/views/widgets/auth_subtitle.dart';
import '../../../auth/presentation/views/widgets/auth_title.dart';
import 'widgets/fill_profile_form.dart';
import 'widgets/submit_consumer_button.dart';

class FillProfileView extends StatelessWidget {
  const FillProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: AuthTitle(title: AppStrings.fillYourProfile),
              ),
              const SliverToBoxAdapter(
                child: AuthSubTitle(
                  subTitle: AppStrings.fillProfileViewDescription,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 32.h, bottom: 16.h),
                  child: const FillProfileForm(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SubmitConsumerButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
