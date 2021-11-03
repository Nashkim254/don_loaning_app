import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/numeric_keyboard.dart';
import 'package:don/src/registration/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Otp extends StatelessWidget {
  Otp({Key? key}) : super(key: key);
  static const routeName = '/otp';
  final controller = Get.put(PinController());
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            
          
              Padding(
                padding:  EdgeInsets.only(top: 80.h),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GetBuilder<PinController>(
                        init: PinController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GetBuilder<PinController>(
                        init: PinController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(1),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GetBuilder<PinController>(
                        init: PinController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(2),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GetBuilder<PinController>(
                        init: PinController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(3),
                      ),
                    ],
                  ),
                ),
              ),
             Padding(
               padding:  EdgeInsets.only(bottom:14.h,top:80.h),
               child: Container(
                child: NumericKeyboard(
                  onKeyboardTap: controller.onKeyboardTap,
                  textColor: Theme.of(context).primaryColor,
                  rightIcon: Icon(
                    Icons.backspace_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  rightButtonFn: () => controller.updateSelect(),
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, bool autoFocus, int position) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: controller.otpController,
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
              focusedBorder:InputBorder.none,
            )
            ),
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
