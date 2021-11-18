import 'package:don/src/Home/view.dart';
import 'package:don/src/LoanApplication/view.dart';
import 'package:don/src/LoansPayback/view.dart';
import 'package:don/src/loanHistory/view.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/notifications/view.dart';
import 'package:don/src/registration/otp/view.dart';
import 'package:don/src/registration/phone/view.dart';
import 'package:don/src/registration/register/view.dart';
import 'package:don/src/registration/success/view.dart';
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
           
            case Register.routeName:
              return  Register();
            case Phone.routeName:
              return  Phone();
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
              return  Login();
              case Success.routeName:
              return const Success();

            default:
              return const SplashScreen();
          }
        });
  }
}
