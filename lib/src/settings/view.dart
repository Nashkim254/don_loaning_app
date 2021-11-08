import 'package:don/src/constants/colors.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);
static const routeName = '/appsettings';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
       backgroundColor: pinBackgroundColor,
      appBar: AppBar(
       leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
        title: Text(
          "Settings",
          style: theme.textTheme.bodyText1!.copyWith(
              color: blackColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShakeTransition(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 24.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      height: 43.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: cardLightColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 18.w, top: 13.h),
                              child: const Icon(Icons.dark_mode)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "App Theme",
                              style: theme.textTheme.bodyText1!.copyWith(
                                  color: primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/forth.png"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ShakeTransition(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 24.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      height: 43.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: cardLightColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 18.w, top: 13.h),
                              child: const Icon(Icons.phone)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Change phone number",
                              style: theme.textTheme.bodyText1!.copyWith(
                                  color: primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/forth.png"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ShakeTransition(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 24.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      height: 43.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: cardLightColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 18.w, top: 13.h),
                              child: const Icon(Icons.message)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "About us",
                              style: theme.textTheme.bodyText1!.copyWith(
                                  color: primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/forth.png"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ShakeTransition(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 24.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/notifications');
                    },
                    child: Container(
                      height: 43.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: cardLightColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 18.w, top: 13.h),
                              child: const Icon(Icons.help)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Help",
                              style: theme.textTheme.bodyText1!.copyWith(
                                  color: primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/forth.png"),
                          )
                        ],
                      ),
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
