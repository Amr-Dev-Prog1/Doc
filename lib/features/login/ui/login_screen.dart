import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helpers/spaceing.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_application_1/core/widget/app_text_button.dart';
import 'package:flutter_application_1/core/widget/login_text_filed.dart';
import 'package:flutter_application_1/features/login/data/models/login_screen_body.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/login/ui/widget/already_have_account.dart';
import 'package:flutter_application_1/features/login/ui/widget/email_and_password.dart';
import 'package:flutter_application_1/features/login/ui/widget/login_bloc_listener.dart';
import 'package:flutter_application_1/features/login/ui/widget/terms_and_conditions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back", style: TextStyles.font32BlueBold),
              heightSpace(10),
              Text(
                "We're excited to have you back, can't wait to see what you'vebeen up to since you last logged in.",
                style: TextStyles.font12Graynormal,
              ),
              heightSpace(36),

              Column(
                children: [
                  EmailAndPassword(),
                  heightSpace(20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font13Bluenormal,
                      ),
                    ),
                  ),
                  heightSpace(30),

                  AppTextButton(
                    butnText: "Login",
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                    textStyle: TextStyles.font16WhiteSemiBold,
                  ),

                  heightSpace(30),
                  const TermsAndConditions(),
                  heightSpace(30),
                  const AlreadyHaveAccount(),
                  const LoginBlocListener(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      // If the form is valid, proceed with the login logic
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
