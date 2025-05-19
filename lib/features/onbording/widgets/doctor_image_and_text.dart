import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/low_DocDoc_logo.svg',
                   
                  ),
                  Container(
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                      colors:[
                      Colors.white,
                      Colors.white.withAlpha(10) ,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.14, .40],
                      ),
                    ),
                    child: Image.asset(
                     'assets/images/Image.png',
                     width: 1.sw, // عرض الشاشة
                      fit: BoxFit.cover,
                  ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 5,
                    right: 5,
                    child: Text("Best Doctor Appointment App",
                      textAlign: TextAlign.center,
                      style: TextStyles.font32BlueBold.copyWith(
                        height: 1.5.h
                      ),
                    ),

                  )
                ],
              );
  }
}