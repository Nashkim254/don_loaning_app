import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pinBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 118.h,
                width: 118.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.done,
                    size: 80,
                    color: cardLightColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
