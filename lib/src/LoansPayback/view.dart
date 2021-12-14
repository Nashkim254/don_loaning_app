import 'package:don/src/LoansPayback/controller.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/input_formarter.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoansPayback extends StatelessWidget {
  LoansPayback({Key? key}) : super(key: key);
  static const routeName = '/payback';
  final controller = Get.put(LoanRepayController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Loans",
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
              const Text(
                "Enter the amount you wish to pay Ksh.",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:20.w,right:20.w),
                child: TextField(
                  style: theme.textTheme.bodyText1,
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controller.amountCont,
                ),
              ),
              SizedBox(height: 20.h),
              ShakeTransition(
                child: Card(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      printSuccess("Load...");
                      printSuccess(controller.token);
                      printSuccess(controller.amountCont.text);
                      printSuccess(controller.number);
                      controller.loanRepayMethod(controller.token);
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
                  " If you are not redirected to input your\n m-pesa pin in 5 seconds, kindly pay via till number\n below Then complete the process by sending us\n the M-Pesa transaction code",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 19.w, right: 17.w),
                child: ListTile(
                  leading: Text(
                    "TILL NUMBER",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    "9279823",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
             
              SizedBox(height: 20.h),
                  const Text(
                "Enter the M-PESA transaction code",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:20.w,right:20.w),
                child: TextField(
                  inputFormatters: [UpperCaseTextFormatter()],
                  style: theme.textTheme.bodyText1,
                  controller: controller.transCont,
                ),
              ),
               SizedBox(height: 45.h),
              ShakeTransition(
                child: GestureDetector(
                  onTap: () {
                    printSuccess("Load...");
                    printSuccess(controller.token);
                    printSuccess(controller.number);
                    controller.transMethod(controller.token);
                    // Navigator.pushNamed(context, '/hhistory');
                  },
                  child: Container(
                    height: 30.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Complete Transaction",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: cardLightColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
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
