import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By Logging in, you agree to our ',
            style: TextStyles.font13GrayNormal
          ),
          TextSpan(
            text: 'Terms and conditions Service',
            style: TextStyles.font13DarckBlueMedium
          ),
          TextSpan(
            text: ' and ',
            style:  TextStyles.font13GrayNormal.copyWith(height: 1.5.h)
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyles.font13DarckBlueMedium,
          ),
        ]
      ),
    );
  }
}