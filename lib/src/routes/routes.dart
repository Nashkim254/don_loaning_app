import 'package:don/src/onboarding/available.dart';
import 'package:don/src/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) {
          switch (settings.name) {
            case SplashScreen.routeName:
              return const SplashScreen();
            case Available.routeName:
              return const Available();
            default:
              return const SplashScreen();
          }
        });
  }
}
