import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/routes.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is Loading || current is Success || current is Error;
      },
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManger.mainBlue,
                    ),
                  ),
            );
          },
          success: (loginResponse) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {}
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {}
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(error, style: TextStyles.font15DarkBlueMedium),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Got it', style: TextStyles.font14BlueSemiBold),
              ),
            ],
          ),
    );
  }
}
