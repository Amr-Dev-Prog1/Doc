import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return             RichText(
  text: TextSpan(
    text: 'Dont have an account? ',
    style: TextStyles.font16DarkBlueMedium,
    children: [
      TextSpan(
        text: 'Sing Up',
        style: TextStyles.font13BlueNormal
      ),
    ],
  ),
)
;
  }
}