import 'package:don/src/LoanApplication/view.dart';
import 'package:don/src/Loans/controller.dart';
import 'package:don/src/LoansPayback/view.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/dateformarter.dart';
import 'package:don/src/loanHistory/view.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Loans extends StatelessWidget {
   Loans({Key? key}) : super(key: key);
  static const routeName = '/loans';
  final controller = Get.put(LoanController());
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
                      onTap: () {
                        Get.to(LoansPayback());
                      },
                      leading: Padding(
                        padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                        child:  Text(
                          "Loan Status:",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      title: Padding(
                        padding:  EdgeInsets.only(left:17.w),
                        child: Text(
                          controller.historyList[0].released! ? "Approved" : "Pending",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(controller.historyList[0].released! ? "assets/images/check.png" : "assets/images/pending.png"),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 30.w, right: 30.w),
              child: Container(
                height: 196.h,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  padding:  EdgeInsets.only(right:2.w),
                                  child: Text(
                                    controller.historyList[0].amount.toString(),
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
                                    f.format(controller.historyList[0].expectedPayDay!),
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
                        padding: EdgeInsets.only(left: 18.w),
                        child: Card(
                          elevation: 5,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(LoanApplication());
                            },
                            child: Container(
                              height: 30.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: cardLightColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "REQUEST LOAN",
                                      style: theme.textTheme.bodyText1!
                                          .copyWith(
                                              color: primaryColor,
                                              fontSize: 11),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset("assets/images/forth.png"),
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
                      onTap: () {
                        Get.to(LoansPayback());
                      },
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
                          child: GestureDetector(
                            onTap: () {
                             Get.to(LoansHistory());
                            },
                            child: Container(
                              height: 30.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: primaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 28.w),
                                    child: Text(
                                      "View all",
                                      style: theme.textTheme.bodyText1!
                                          .copyWith(
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
                    ),
                    Obx(() {
          if (controller.isLoadingHistory.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.historyList.length,
              itemBuilder: (context, int index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.email, color: primaryColor),
                    title: Text(
                      "Applied for Ksh. ${controller.historyList[index].amount}",
                      style: theme.textTheme.bodyText1!.copyWith(
                          color: blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: Text(
                      f.format(controller.historyList[index].requestDate!).toString(),
                      style: theme.textTheme.bodyText1!.copyWith(
                          color: blackColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              });
        }
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
