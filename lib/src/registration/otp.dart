import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);
  static const routeName = '/otp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardLightColor,
        title: Text("Register", style: TextStyle(color: blackColor)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: blackColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 29.h),
            RichText(
              text: TextSpan(
                text: 'The OTP has been sent to +2547345678 via SMS \n',
                style: TextStyle(color: blackColor, fontSize: 10.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: ' TNo SMS received?',
                    style: TextStyle(color: blackColor, fontSize: 10.sp),
                  ),
                  TextSpan(
                    text: ' Try OTP via voice call',
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 10.sp,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(height:22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
