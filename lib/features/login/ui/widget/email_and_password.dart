import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/helpers/app_regex.dart';
import 'package:flutter_application_1/core/helpers/spaceing.dart';
import 'package:flutter_application_1/core/widget/login_text_filed.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/login/ui/widget/email_and_password.dart'
    as passwordController;
import 'package:flutter_application_1/features/login/ui/widget/passwordValidations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;
  bool isObscureText = true;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerLisener();
  }

  void setUpPasswordControllerLisener() {
    passwordController.addListener(() {
      final password = passwordController.text;

      hasUpperCase = AppRegex.hasUpperCase(password);
      hasLowerCase = AppRegex.hasLowerCase(password);
      hasNumber = AppRegex.hasNumber(password);
      hasSpecialCharacter = AppRegex.hasSpecialCharacter(password);
      hasMinLength = AppRegex.hasMinLength(password);

      // Trigger a rebuild to update the UI
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),

          heightSpace(20),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',

            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF757575),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          PasswordValidations(
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasNumber: hasNumber,
            hasSpecialCharacter: hasSpecialCharacter,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
