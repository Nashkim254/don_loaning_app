import 'package:don/src/ForgotPassword/phone/view.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  static const routeName = '/login';

  final controller = Get.put(LoginController());
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
        title: Text("Login",
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
                  controller: controller.username,
                  style: theme.textTheme.bodyText1,
                  decoration:const InputDecoration(
                    label: Text('Phone Number'),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
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
                child:  Obx( () {
                    return TextField(
                      controller: controller.pass,
                      style: theme.textTheme.bodyText1,
                      obscureText: controller.isObscure.value,
                      decoration:  InputDecoration(
                          label: Text('Password'),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffix: IconButton(onPressed: (){
                            controller.changeObscure();
                          }, icon: Icon(controller.isObscure.value ? Icons.visibility : Icons.visibility_off)),
                          ),
                    );
                  }
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 47.w, top: 12.h),
              child: TextButton(
                onPressed: () {
                  Get.to(PhoneReset());
                },
                child: Text(
                  "Forgot password?",
                  style: theme.textTheme.bodyText1!
                      .copyWith(color: primaryColor, fontSize: 10.sp),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 33.h, left: 150.w, right: 150.w),
              child: GestureDetector(
                onTap: () {
                 controller.loginMethod();
                },
                child: Container(
                  child: Image.asset("assets/images/go.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 61.w),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: primaryColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(width: 5.w),
                  RichText(
                    text: TextSpan(
                      text: 'I accept these',
                      style: TextStyle(color: blackColor, fontSize: 10.sp),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Terms of Use',
                          style:
                              TextStyle(color: primaryColor, fontSize: 10.sp),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: blackColor, fontSize: 10.sp),
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style:
                              TextStyle(color: primaryColor, fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
