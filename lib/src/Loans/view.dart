import 'package:don/src/constants/colors.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loans extends StatelessWidget {
  const Loans({Key? key}) : super(key: key);
  static const routeName = '/loans';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Loans",
          style: theme.textTheme.bodyText1!.copyWith(
              color: blackColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
              child: Container(
                height: 186.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.h, left: 16.w, right: 147.w),
                      child: Text("Outstanding Loan",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: cardLightColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.h),
                      child: ListTile(
                        leading: Text(
                          "Amount",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: cardLightColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "Due date",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: cardLightColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: ShakeTransition(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 30.h,
                            width: 120.w,
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
                                    "Ksh.",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: primaryColor, fontSize: 11),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "50,000.00",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: primaryColor, fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      trailing: ShakeTransition(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 30.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: cardLightColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 13.w),
                                  child: Text(
                                    "15/7/2021",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: primaryColor, fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ShakeTransition(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 30.h,
                            width: 120.w,
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
                                    "REQUEST LOAN",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: primaryColor, fontSize: 11),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h, left: 30.w, right: 30.h),
              child: Card(
                elevation: 5,
                child: Container(
                  height: 43.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardLightColor),
                  child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child: SizedBox(
                            height: 19.h,
                            width: 19.w,
                            child: Image.asset("assets/images/efficient.png")),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Repay due loans",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/forth.png"),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 28.w,
                right: 30.w,
                top: 28.w,
              ),
              child: Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cardLightColor),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Loans History",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: ShakeTransition(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 30.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left:28.w),
                                  child: Text(
                                    "View all",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                        color: cardLightColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading:Icon(Icons.email,color:primaryColor),
                      title: Text(
                        "Paid back Ksh.50,000.00",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        "01/12/2020",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      leading:Icon(Icons.email,color:primaryColor),
                      title: Text(
                        "Paid back Ksh.50,000.00",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        "01/12/2020",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      leading:Icon(Icons.email,color:primaryColor),
                      title: Text(
                        "Paid back Ksh.50,000.00",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        "01/12/2020",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      leading:Icon(Icons.email,color:primaryColor),
                      title: Text(
                        "Paid back Ksh.50,000.00",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        "01/12/2020",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ListTile(
                      leading:Icon(Icons.email,color:primaryColor),
                      title: Text(
                        "Paid back Ksh.50,000.00",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        "01/12/2020",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
