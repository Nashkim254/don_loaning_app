import 'package:don/src/onboarding/available.dart';
import 'package:don/src/onboarding/efficient.dart';
import 'package:don/src/onboarding/reliable.dart';
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
              case Efficient.routeName:
              return const Efficient();
               case Reliable.routeName:
              return const Reliable();
            default:
              return const SplashScreen();
          }
        });
  }
}
