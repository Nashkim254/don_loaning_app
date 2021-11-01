import 'package:don/src/constants/colors.dart';
import 'package:don/src/registration/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Otp extends StatelessWidget {
  Otp({Key? key}) : super(key: key);
  static const routeName = '/otp';
  final controller = Get.put(SignInOtpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardLightColor,
        title: Text("Register", style: TextStyle(color: blackColor)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: blackColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 29.h),
            RichText(
              text: TextSpan(
                text: 'The OTP has been sent to +2547345678 via SMS \n',
                style: TextStyle(color: blackColor, fontSize: 10.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: ' TNo SMS received?',
                    style: TextStyle(color: blackColor, fontSize: 10.sp),
                  ),
                  TextSpan(
                    text: ' Try OTP via voice call',
                    style: TextStyle(
                        color: blueColor,
                        fontSize: 10.sp,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  decoration: BoxDecoration(
                    color: cardLightColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _otpTextField(context, true, 0),
                  _otpTextField(context, false, 1),
                  _otpTextField(context, false, 2),
                  _otpTextField(context, false, 3),
                 // _otpTextField(context, false, 4),
                  //_otpTextField(context, false, 5),
                  // controller.otpNumberWidget(0),
                  // controller.otpNumberWidget(1),
                  // controller.otpNumberWidget(2),
                  // controller.otpNumberWidget(3)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, bool autoFocus, int position) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: TextFormField(
          keyboardType: TextInputType.phone,
          validator: (value) => controller.validatorEmpty(value!),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
              controller.onKeyboardTap(value);
            }
          },
          maxLines: 1,
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(

              enabledBorder:InputBorder.none,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: otpColor,
              ),
            ),
          )
          ),
    );
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: fontSecondaryDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          controller.text[position],
          style: TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: otpColor,
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }
  }
}
