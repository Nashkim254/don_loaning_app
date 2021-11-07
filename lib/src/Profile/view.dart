import 'package:don/src/constants/colors.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static const routeName = '/profilepage';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: theme.textTheme.bodyText1!.copyWith(
              color: blackColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
              child: Container(
                height: 130.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: cardLightColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 23.w, top: 16.h),
                            child: Container(
                                height: 58.h,
                                width: 58.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1.w,
                                    color: primaryColor,
                                  ),
                                ),
                                child: Center(child: Icon(Icons.person))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: VerticalDivider(
                              thickness: 2,
                              indent: 20.h,
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, left: 20.w),
                                  child: Text(
                                    "John Doe",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: blackColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, left: 20.w),
                                  child: Text(
                                    "johndoe@gmail.com",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: blackColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Edit details",
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: cardLightColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ShakeTransition(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  top: 57.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/request');
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
                            child:Icon(Icons.notifications)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Notifications",
                              style: theme.textTheme.bodyText1!
                                  .copyWith(color: primaryColor, fontSize: 16.sp,fontWeight:FontWeight.w600),
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
                  top: 21.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/request');
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
                            child:Icon(Icons.settings)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Settings",
                              style: theme.textTheme.bodyText1!
                                  .copyWith(color: primaryColor, fontSize: 16.sp,fontWeight:FontWeight.w600),
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
                  top: 21.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/request');
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
                            child:Icon(Icons.note_add)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Terms of use and Privacy",
                              style: theme.textTheme.bodyText1!
                                  .copyWith(color: primaryColor, fontSize: 16.sp,fontWeight:FontWeight.w600),
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
                  top: 21.h,
                ),
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/request');
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
                            child:Icon(Icons.logout)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Log out",
                              style: theme.textTheme.bodyText1!
                                  .copyWith(color: primaryColor, fontSize: 16.sp,fontWeight:FontWeight.w600),
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
