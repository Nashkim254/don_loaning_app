import 'package:don/src/constants/colors.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/models/onboarding_model.dart';
import 'package:don/src/registration/phone/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 138.w,
                        right: 138.w,
                        top: 97.0.h,
                      ),
                      child: Text(contents[i].title!,
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 96.0.w, top: 7.h, right: 70.w),
                      child: Text(
                        contents[i].discription!,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                             Padding(
                padding: EdgeInsets.only(top: 87.h, left: 113.w, right: 59.w),
                child: SvgPicture.asset(contents[i].image!)
                //Image.asset("assets/images/available.png"),
                ),

          Padding(
            padding:  EdgeInsets.only(top:126.h),
            child: Container(
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 33.h),
            child: GestureDetector(
              onTap: () {
                Get.to(Login());
              },
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
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 10.h),
            child: GestureDetector(
              onTap: () => Get.to(Phone()),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 7.h,
      width: 7.w,
      decoration: currentIndex == contents.length
          ? 
          BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: primaryColor)
          : BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: primaryColor,
              ),
            ),
    );
  }
}
