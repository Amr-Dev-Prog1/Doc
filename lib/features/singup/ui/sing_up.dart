import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helpers/spaceing.dart';
import 'package:flutter_application_1/core/widget/app_text_button.dart';
import 'package:flutter_application_1/features/singup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/features/singup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter_application_1/features/singup/ui/widgets/sign_up_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/styles.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: TextStyles.font24BlueBold),
                heightSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                heightSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    heightSpace(40),
                    AppTextButton(
                      butnText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    heightSpace(16),
                    // const TermsAndConditionsText(),
                    heightSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
