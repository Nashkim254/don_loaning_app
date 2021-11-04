import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoanApplication extends StatelessWidget {
  const LoanApplication({Key? key}) : super(key: key);

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
                title: Text("Download the form below,",)
              ),
            ],
          ),
        ));
  }
}
