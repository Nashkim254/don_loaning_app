import 'dart:convert';

import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/models/login_model.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/registration/success/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController pass = TextEditingController();
  var data = Get.arguments;
  String? number;
  var result = ''.obs;
  var box;
  var isObscure = true.obs;
  changeObscure(){
    isObscure.toggle();
  }
  var initialValue;
  var bytesInLatin1_decoded;
  // Login user
  var isLoadingBills = true.obs;
  updateToken(String token) async {
  box = await Hive.openBox('userInfo');
  box.put('token', token);
  printSuccess("tokennsaved to box");
}
@override
void onInit()async{
  super.onInit();
  box = await Hive.openBox('userInfo');
}
  loginMethod() async {
    print("Logining...");
    print("=========" + formatLoginNumber(username.text));
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills.toggle();
    LoginModel loginModel = LoginModel(
      username: formatLoginNumber(username.text),
      password: pass.text,
    );
    LoginResponseModel response = await login(loginModel);
    print("code 2");

    printSuccess(response.data['key']);
    updateToken(response.data['key']);
    printSuccess('your token has been saved');

// decoding
 // bytesInLatin1_decoded = base64.decode(response.data['key']);
//  Codec<String, String> stringToBase64 = utf8.fuse(base64);
//        initialValue =    stringToBase64.decode(response.data['key']);
    if (response.code == 200) {
      printSuccess(initialValue);
      box = await Hive.openBox('userInfo');
      printInfo("getting user...");
      Get.offAll(const NavigationView());
      showToastSuccess("user Logged in successfully");
      await getUser("${response.data['key']}");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else if (response.code == 400) {
      printError(response.data['error']);
      Get.back();
      showToastError('${response.data['non_field_errors'][0]}');
    }
    update();
  }
}
