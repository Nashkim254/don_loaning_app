import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  static const routeName = '/register';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardLightColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: blackColor),
        ),
        title: Text("Register",
            style: theme.textTheme.headline5!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: blackColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 27.h),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    label: Text('Email address'),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      label: Text('Password'),
                      border: InputBorder.none,
                      suffix: Icon(Icons.remove_red_eye)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      label: Text('Confirm password'),
                      border: InputBorder.none,
                      suffix: Icon(Icons.remove_red_eye)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 33.h, left: 150.w, right: 150.w),
              child: GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, '/success'),
                child: Container(
                  child: Image.asset("assets/images/go.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 61.w),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: primaryColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(width: 5.w),
                  RichText(
                    text: TextSpan(
                      text: 'I accept these',
                      style: TextStyle(color: blackColor, fontSize: 10.sp),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Terms of Use',
                          style:
                              TextStyle(color: primaryColor, fontSize: 10.sp),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: blackColor, fontSize: 10.sp),
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style:
                              TextStyle(color: primaryColor, fontSize: 10.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
