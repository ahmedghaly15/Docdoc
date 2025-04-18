import 'package:docdoc/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/doctor.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../../../core/widgets/doctor_item.dart';
import '../../../../core/widgets/primary_button.dart';
import 'widgets/book_appointment_sheet_content.dart';
import 'widgets/doctor_detail_sub_title.dart';
import 'widgets/doctor_detail_title.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppConstants.screenPadding,
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                titleText: 'Dr. ${doctor.name}',
                actions: [
                  IconButton(
                    style: AppConstants.iconButtonStyle,
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 32.h, bottom: 24.h),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 79.h,
                    child: DoctorItem(doctor: doctor),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: DoctorDetailTitle(text: AppStrings.aboutMe),
              ),
              if (doctor.description != null)
                SliverToBoxAdapter(
                  child: DoctorDetailSubTitle(text: doctor.description!),
                ),
              const SliverToBoxAdapter(
                child: DoctorDetailTitle(text: AppStrings.workingTime),
              ),
              SliverToBoxAdapter(
                child: DoctorDetailSubTitle(
                  text: '${doctor.startTime} - ${doctor.endTime}',
                ),
              ),
              const SliverToBoxAdapter(
                child: DoctorDetailTitle(text: AppStrings.appointmentPrice),
              ),
              SliverToBoxAdapter(
                child: DoctorDetailSubTitle(text: '\$ ${doctor.appointPrice}'),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    PrimaryButton(
                      text: AppStrings.makeAnAppointment,
                      onPressed: () => context.showModalBottomSheet(
                        builder: (_) =>
                            BookAppointmentSheetContent(doctorId: doctor.id),
                      ),
                    )
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
