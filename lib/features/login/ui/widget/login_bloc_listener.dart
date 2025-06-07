import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helpers/extensions.dart';
import 'package:flutter_application_1/core/routing/routes.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/styles.dart';
import 'package:flutter_application_1/features/login/data/models/login_response.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    print('LoginBlocListener build called');
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        print('listenWhen: previous=$previous, current=$current');
        return current is Loading || current is Success || current is Error;
      },
      listener: (context, state) {
        print('BlocListener listener triggered with state: $state');
        state.whenOrNull(
          loading: () {
            print('State is loading, showing dialog');
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
            print('State is success, navigating to home');
            print('loginResponse.status: ${loginResponse.status}');
            print('loginResponse.code: ${loginResponse.code}');
            print('loginResponse.message: ${loginResponse.message}');
            if (Navigator.canPop(context)) {
              print('Navigator can pop, popping dialog');
              Navigator.pop(context);
            } else {
              print('Navigator cannot pop, skipping pop');
            }
            print('Navigating to home: ${Routes.home}');
            Navigator.pushReplacementNamed(context, Routes.home);
          },
          error: (error) {
            print('State is error, showing error dialog: $error');
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    print('setupErrorState called with error: $error');
    if (Navigator.canPop(context)) {
      print('Popping dialog before showing error');
      Navigator.pop(context);
    } else {
      print('No dialog to pop before showing error');
    }
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(error, style: TextStyles.font15DarkBlueMedium),
            actions: [
              TextButton(
                onPressed: () {
                  print('Error dialog dismissed');
                  Navigator.pop(context);
                },
                child: Text('Got it', style: TextStyles.font14BlueSemiBold),
              ),
            ],
          ),
    );
  }
}
