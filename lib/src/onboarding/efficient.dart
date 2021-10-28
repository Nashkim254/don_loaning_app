import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Efficient extends StatelessWidget {
  const Efficient({Key? key}) : super(key: key);
  static const routeName = '/efficient';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 138.w,
                right: 138.w,
                top: 97.0.h,
              ),
              child: Text("Efficient",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 96.0.w, top: 7.h, right: 70.w),
              child: Text(
                "If money is the problem, \n nmake us your solution",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 87.h, left: 107.w, right: 107.w),
              child: SvgPicture.asset("assets/images/efficient.svg")
              //Image.asset("assets/images/available.png"),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 126.h, left: 158.w),
                  child: Container(
                    height: 7.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 126.h,
                  ),
                  child: Container(
                    height: 7.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: primaryColor,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 126.h,
                  ),
                  child: Container(
                    height: 7.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: primaryColor,
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 33.h),
              child: Container(
                  height: 31.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: primaryColor,
                      )),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(color: primaryColor, fontSize: 16.sp),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
              child: GestureDetector(
                onTap:()=>Navigator.pushNamed(context, '/reliable'),
                child: Container(
                  height: 31.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(color: cardLightColor, fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
