import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/numeric_keyboard.dart';
import 'package:don/src/helpers/toasts.dart';
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
            padding:  EdgeInsets.only(top:80.h,left:16.w,right: 16.w),
            child: Container(
                height: 40.h,
                width:double.infinity,
                decoration: BoxDecoration(
                  color: cardLightColor,
                ),
                child:  TextField(
                //  readOnly: true,
                keyboardType: TextInputType.number,
              controller: controller.otpController,
             // validator: (value) => controller.validatorEmpty(value!),
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
          ),
             Padding(
                  padding: EdgeInsets.only(top: 133.h, left: 150.w, right: 150.w),
                  child: GestureDetector(
                    onTap: () {
                        if(controller.otpController.text.length == 6){
                            controller.otpMethod();
                        }else{
                          Navigator.pop(context);
                          showToastError("Length of field should be 6");
                        }
                        
                    } ,
                    child: Container(
                      child: Image.asset("assets/images/go.png"),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
