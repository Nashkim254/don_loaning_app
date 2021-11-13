import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/numeric_keyboard.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Otp extends StatelessWidget {
  Otp({Key? key}) : super(key: key);
  static const routeName = '/otp';
  final controller = Get.put(OtpController());
  var data = Get.arguments;
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
             Obx( () {
                 return Text(
                     'The OTP has been sent to ${controller.result.value} via SMS \n',
                    style: TextStyle(color: blackColor, fontSize: 10.sp),
                    
                  
            );
               }
             ),
            //Text(controller.data[0]),
          
              Padding(
                padding:  EdgeInsets.only(top: 80.h),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GetBuilder<OtpController>(
                        init: OtpController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(0),
                      ),
                      GetBuilder<OtpController>(
                        init: OtpController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(1),
                      ),
                      GetBuilder<OtpController>(
                        init: OtpController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(2),
                      ),
                      GetBuilder<OtpController>(
                        init: OtpController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(3),
                      ),
                      GetBuilder<OtpController>(
                        init: OtpController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(4),
                      ),
                      GetBuilder<OtpController>(
                        init: OtpController(), // INIT IT ONLY THE FIRST TIME
                        builder: (_) => otpNumberWidget(5),
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
      height: 40.h,
      width: 40.w,
      decoration: const BoxDecoration(
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
            decoration:const InputDecoration(

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
          style:const TextStyle(color: Colors.black),
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
