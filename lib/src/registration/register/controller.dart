import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/models/register.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/registration/success/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  var data = Get.arguments;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? number;
  var result = ''.obs;
  goToSuccessPagege() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.to( Login()),
    );

    Get.to(
      const Success(),
    );
  }

  // register user
  var isLoadingBills = true.obs;

  registerMethod() async {
    print("registering...");
    Get.dialog(CustomDialog(), barrierDismissible: true);
    isLoadingBills.toggle();
    final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;
    print("code1");
    print(isLoadingBills);
    print(email.text);
    print(number);
    print(pass2.text);
    print(pass1.text);
    RegisterModel registerModel = RegisterModel(
      email: email.text,
      password1: pass1.text,
      password2: pass2.text,
      username: number,
    );
    RegisterResponseModel response = await register(registerModel);
    print("code 2");

    print(response.code);
    if (response.code == 200) {
      goToSuccessPagege();
      showToastSuccess("user registered successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else if(response.code == 400){
      print(response.code);
      print(response.data['error']);

      showToastError('User Already exists');
    }
    update();
  }
}
