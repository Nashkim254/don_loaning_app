import 'package:don/src/constants/colors.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoansPayback extends StatelessWidget {
  const LoansPayback({Key? key}) : super(key: key);

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
              SizedBox(height: 20.h),
              Container(
                height: 270.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  children: [
                    ShakeTransition(
                      child: Card(
                        elevation: 5,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/hhistory');
                          },
                          child: Container(
                            height: 30.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "CLICK TO PAY LOAN",
                                style: theme.textTheme.bodyText1!.copyWith(
                                    color: cardLightColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 21.w),
                      child: Text(
                        "If you are not redirected to input your\n m-pesa pin in 5 seconds, kindly pay via\n paybill below and use your mobile\n number as the account number",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:19.w,right:17.w),
                      child: ListTile(
                        leading: Text(
                          "PAYBILL NUMBER",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "123456",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:19.w,right:17.w),
                      child: ListTile(
                        leading: Text(
                          "ACCOUNT NUMBER",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "2547-xxxxxxxx",
                          style: theme.textTheme.bodyText1!.copyWith(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
