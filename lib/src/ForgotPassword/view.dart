import 'package:don/src/ForgotPassword/controller.dart';
import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({Key? key}) : super(key: key);
 // static const routeName = '/login';

  final controller = Get.put(ResetPassController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardLightColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: blackColor),
        ),
        title: Text("Reset your Password",
            style: theme.textTheme.headline5!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: blackColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 27.h),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:  TextField(
                  controller: controller.code,
                  style: theme.textTheme.bodyText1,
                  decoration:const InputDecoration(
                    label: Text('Code'),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffix: Icon(Icons.remove_red_eye)
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 27.h),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:  TextField(
                  controller: controller.pass1,
                  style: theme.textTheme.bodyText1,
                  obscureText: true,
                  decoration:const InputDecoration(
                    label: Text('New Password'),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffix: Icon(Icons.remove_red_eye)
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
              child: Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cardLightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child:  TextField(
                  controller: controller.pass2,
                  style: theme.textTheme.bodyText1,
                  obscureText: true,
                  decoration: const InputDecoration(
                      label: Text('Confirm new Password'),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      suffix: Icon(Icons.remove_red_eye)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 33.h, left: 150.w, right: 150.w),
              child: GestureDetector(
                onTap: () {
                  controller.resetMethod();
                },
                child: Container(
                  child: Image.asset("assets/images/go.png"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
