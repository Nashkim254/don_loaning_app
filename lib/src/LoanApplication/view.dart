import 'package:don/src/constants/colors.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoanApplication extends StatelessWidget {
  const LoanApplication({Key? key}) : super(key: key);
  static const routeName = '/request';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Loan Application",
            style: theme.textTheme.bodyText1!.copyWith(
                color: blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Easy Steps",
                style: theme.textTheme.bodyText1!.copyWith(
                    color: primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 26.h),
              ListTile(
                  leading: Container(
                    height: 21.h,
                    width: 21.w,
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        "1",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  title: Text(
                    "Download the form below,",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: 23.h),
              ListTile(
                  leading: Container(
                    height: 21.h,
                    width: 21.w,
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        "2",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  title: Text(
                    "Fill the required information for loan application and upload the form",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: 23.h),
              ListTile(
                  leading: Container(
                    height: 21.h,
                    width: 21.w,
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        "3",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  title: Text(
                    "Loan Approval",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: 23.h),
              ListTile(
                  leading: Container(
                    height: 21.h,
                    width: 21.w,
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        "4",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  title: Text(
                    "Receive the loan",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: 45.h),
              ShakeTransition(
                child: Padding(
                  padding: EdgeInsets.only(left: 90.w, right: 90.w),
                  child: Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/request');
                      },
                      child: Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: cardLightColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "DOWNLOAD LOAN FORM",
                                style: theme.textTheme.bodyText1!.copyWith(
                                  color: primaryColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Icon(Icons.download, color: primaryColor))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 79.h),
              ShakeTransition(
                child: Padding(
                  padding: EdgeInsets.only(left: 90.w, right: 90.w),
                  child: Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/request');
                      },
                      child: Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: cardLightColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "UPLOAD LOAN FORM",
                                style: theme.textTheme.bodyText1!.copyWith(
                                  color: primaryColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Icon(Icons.upload, color: primaryColor))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}