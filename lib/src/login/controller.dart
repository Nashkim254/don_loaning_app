import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/models/login_model.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/registration/success/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  var data = Get.arguments;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? number;
  var result = ''.obs;

  // Login user
  var isLoadingBills = true.obs;

  loginMethod() async {
    print("Logining...");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills.toggle();
    final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;
    print("code1");
    print(isLoadingBills);
    print(email.text);
    print(number);
    print(pass.text);
    LoginModel loginModel = LoginModel(
      email: email.text,
      username: number,
       password: pass.text,
    );
    LoginResponseModel response = await login(loginModel);
    print("code 2");

    print(response.code);
    if (response.code == 200 ) {
      Get.to(const NavigationView(),arguments: [number]);
      showToastSuccess("user Logged in successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else {
      print(response.code);
      print(response.data['error']);

      showToastError('User Already exists');
    }
    update();
  }
}
