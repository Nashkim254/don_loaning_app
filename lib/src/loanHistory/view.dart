import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoansHistory extends StatelessWidget {
  const LoansHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Loans History",
            style: theme.textTheme.bodyText1!.copyWith(
                color: blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.email, color: primaryColor),
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
                leading: Icon(Icons.email, color: primaryColor),
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
                leading: Icon(Icons.email, color: primaryColor),
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
                leading: Icon(Icons.email, color: primaryColor),
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
                leading: Icon(Icons.email, color: primaryColor),
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
        ));
  }
}
