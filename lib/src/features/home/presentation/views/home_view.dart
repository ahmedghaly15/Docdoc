import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import 'widgets/doctor_speciality_list_view.dart';
import 'widgets/find_near_by_doctor_blue_container.dart';
import 'widgets/home_custom_app_bar.dart';
import 'widgets/recommended_doctors_sliver_list.dart';
import 'widgets/see_all_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: HomeCustomAppBar()),
              const SliverToBoxAdapter(
                child: FindNearByDoctorBlueContainer(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 24.h),
                  child: const SeeAllRow(title: AppStrings.doctorSpeciality),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 86.h,
                  margin: EdgeInsets.only(top: 16.h, bottom: 23.h),
                  child: const DoctorSpecialityListView(),
                ),
              ),
              const RecommendedDoctorsSliverList(),
            ],
          ),
        ),
      ),
    );
  }
}
