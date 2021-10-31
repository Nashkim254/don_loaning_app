import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: pinBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:146.h),
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
              SizedBox(height: 53.h),
              Text(
                "Account Created!",
                style: theme.textTheme.bodyText1!
                    .copyWith(color: primaryColor, fontSize: 30.sp),
              ),
              Text(
                "Your account has been created\n                successfully",
                style: theme.textTheme.bodyText1!
                    .copyWith(color: blackColor, fontSize: 14.sp),
              ),
            ],
          ),
        ));
  }
}
