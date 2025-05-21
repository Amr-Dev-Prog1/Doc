import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helpers/spaceing.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_application_1/core/widget/app_text_button.dart';
import 'package:flutter_application_1/core/widget/login_text_filed.dart';
import 'package:flutter_application_1/features/login/ui/widget/already_have_account.dart';
import 'package:flutter_application_1/features/login/ui/widget/terms_and_conditions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 30.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome Back", style: TextStyles.font32BlueBold),
             heightSpace( 10),
              Text("We're excited to have you back, can't wait to see what you'vebeen up to since you last logged in.",
                style: TextStyles.font13GrayNormal),
             heightSpace( 36),

             Form(
              child: Column(
                children: [ 
              LoginTextField(
                hintText: "Email",
                labelText: "Email",
                obscureText: false,
               
              ),
             heightSpace( 20),


              LoginTextField(
                hintText: "Password",
                labelText: "Password",
                obscureText: true,
              ),
              heightSpace( 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?", style: TextStyles.font13BlueNormal),
                ),
              ),
              heightSpace(30),

              AppTextButton(butnText: "Login",onPressed: () {},textStyle: TextStyles.font16WhiteSemiBold,),
             
             heightSpace(30),
              const TermsAndConditions(),
              heightSpace(30),
              const AlreadyHaveAccount(),

                ]
              )
              ),
            ],
          ),
        ),
      ),
      );
    
  }
}