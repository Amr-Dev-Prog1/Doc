import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helpers/extensions.dart';
import 'package:flutter_application_1/core/routing/routes.dart';
import 'package:flutter_application_1/core/theming/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Dont have an account? ',
        style: TextStyles.font13BlueRegular,
        children: [
          TextSpan(
            text: ' sing up',
            style: TextStyles.font13BlueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.pushReplacementNamed(Routes.register);
                  },
          ),
        ],
      ),
    );
  }
}
