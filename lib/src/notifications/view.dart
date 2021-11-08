import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);
  static const routeName = '/notifications';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Notifications",
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
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Your profile details have been updated",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Congratulations! Your loan limit has\n been increased. Get a loan and\n experience friendly rates",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Your profile details have been updated",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Your profile details have been updated",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Your profile details have been updated",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Your profile details have been updated",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Congratulations! Your loan limit has\n been increased. Get a loan and\n experience friendly rates",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Your profile details have been updated",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Divider(),
              ListTile(
                leading: Image.asset("assets/images/logo.png"),
                title: Text(
                  "Congratulations! Your loan limit has\n been increased. Get a loan and\n experience friendly rates",
                  style: theme.textTheme.bodyText1!.copyWith(
                      color: blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ));
  }
}
