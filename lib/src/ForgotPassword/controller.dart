import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/models/login_model.dart';
import 'package:don/src/models/reset_pass_model.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/registration/success/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassController extends GetxController {
  final TextEditingController code = TextEditingController();
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  var data = Get.arguments;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? number;
  var result = ''.obs;

  // Login user
  var isLoadingBills = true.obs;

  resetMethod() async {
    print("Logining...");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills.toggle();
    final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;
    print("code1");
    print(isLoadingBills);
    print(code.text);
    print(number);
    print(pass2.text);
    ResetModel resetModel = ResetModel(
      code: code.text,
       new_password1: pass1.text, 
       new_password2: pass2.text,
        phone: formatPhoneNumber(number!)
    );
    RestResponseModel response = await resetPass(resetModel);
    print("code 2");

    print(response.code);
    if (response.code == 200 ) {
      Get.offAll( Login(),arguments: [number]);
      showToastSuccess("password reset in successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else {
      print(response.code);
      print(response.data['error']);

      showToastError('User Already exists');
    }
    update();
  }
}
