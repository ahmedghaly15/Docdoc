import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:docdoc/src/core/widgets/my_sized_box.dart';
import 'package:docdoc/src/features/home/presentation/views/widgets/doctor_speciality_list_view.dart';
import 'package:docdoc/src/features/home/presentation/views/widgets/doctors_list_view.dart';
import 'package:docdoc/src/features/home/presentation/views/widgets/find_near_by_doctor_blue_container.dart';
import 'package:docdoc/src/features/home/presentation/views/widgets/home_custom_app_bar.dart';
import 'package:docdoc/src/features/home/presentation/views/widgets/see_all_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCustomAppBar(),
              FindNearByDoctorBlueContainer(),
              MySizedBox.height24,
              DoctorSpecialitySeeAll(),
              MySizedBox.height16,
              DoctorSpecialityListView(),
              MySizedBox.height23,
              DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
