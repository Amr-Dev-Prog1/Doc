import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_application_1/features/onbording/widgets/doc_logo_and_name.dart';
import 'package:flutter_application_1/features/onbording/widgets/doctor_image_and_text.dart';
import 'package:flutter_application_1/features/onbording/widgets/grt_startred_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),

              DocLogoAndName(),
              SizedBox(height: 30.h),
              DoctorImageAndText(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                      style: TextStyles.font12GrayRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    const GetStartedButton(),
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
