import 'package:don/src/LoanApplication/view.dart';
import 'package:don/src/LoansPayback/view.dart';
import 'package:don/src/loanHistory/view.dart';
import 'package:don/src/login/login.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/notifications/view.dart';
import 'package:don/src/onboarding/available.dart';
import 'package:don/src/onboarding/efficient.dart';
import 'package:don/src/onboarding/reliable.dart';
import 'package:don/src/registration/otp.dart';
import 'package:don/src/registration/phone_number.dart';
import 'package:don/src/registration/register.dart';
import 'package:don/src/registration/success.dart';
import 'package:don/src/settings/view.dart';
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
            case Register.routeName:
              return const Register();
            case Phone.routeName:
              return const Phone();
            case Otp.routeName:
              return Otp();
            case NavigationView.routeName:
              return const NavigationView();
            case LoansHistory.routeName:
              return const LoansHistory();
            case LoanApplication.routeName:
              return const LoanApplication();
            case LoansPayback.routeName:
              return const LoansPayback();
            case Notifications.routeName:
              return const Notifications();
            case SettingsView.routeName:
              return const SettingsView();
              case Login.routeName:
              return const Login();
              case Success.routeName:
              return const Success();

            default:
              return const SplashScreen();
          }
        });
  }
}
