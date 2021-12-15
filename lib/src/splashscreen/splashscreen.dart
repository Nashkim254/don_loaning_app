import 'dart:async';

import 'package:don/src/constants/colors.dart';
import 'package:don/src/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000),
        () =>Get.to( Onbording()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", height: 77, width: 67),
              const SizedBox(height: 40),
              Text("Instant and quick loans \n anywhere, everywhere",
                  style:
                      theme.textTheme.bodyText2!.copyWith(color: blackColor))
            ],
          ),
        ),
      ),
    );
  }
}
