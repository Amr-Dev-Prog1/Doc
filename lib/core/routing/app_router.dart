import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBording:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
           body:  const Center(
              child: Text('No route defined for this path'),
            ),
          )
        );
    }
  }
}