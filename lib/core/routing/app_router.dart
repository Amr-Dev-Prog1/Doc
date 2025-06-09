import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/di/dependency_injection.dart';
import 'package:flutter_application_1/core/routing/routes.dart';
import 'package:flutter_application_1/features/home/home.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/login/ui/login_screen.dart';
import 'package:flutter_application_1/features/onbording/onboarding_screen.dart';
import 'package:flutter_application_1/features/singup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/features/singup/ui/sing_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBording:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.register:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(), // <-- CORRECT
                child: const SignupScreen(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
