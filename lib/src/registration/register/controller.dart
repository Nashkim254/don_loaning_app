import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/login/view.dart';
import 'package:don/src/models/register.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/registration/success/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  var data = Get.arguments;
  String? number;
  var result = ''.obs;
  var isObscure = true.obs;
  var box;
  var user;
  @override
  void onInit() async {
    super.onInit();
    box = await Hive.openBox('userInfo');
  }

  changeObscure() {
    isObscure.toggle();
  }

  goToSuccessPagege() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.to(Login()),
    );

    Get.to(
      const Success(),
    );
  }

  var isChecked = true.obs;
  onClick(value) {
    isChecked.toggle();
    update();
  }

  /// register user
  var isLoadingBills = true.obs;

  registerMethod() async {
    Get.dialog(CustomDialog(), barrierDismissible: true);
    isLoadingBills.toggle();
    // final SharedPreferences prefs = await _prefs;
    // number = prefs.getString("number");
    // result.value = number!;
    // user = box.get('number');
    // printSuccess("youre + $user");
    printSuccess(data[0]);
    RegisterModel registerModel = RegisterModel(
      email: email.text,
      password1: pass1.text,
      password2: pass2.text,
      username: formatLoginNumber(data[0]),
    );
    box = await Hive.openBox('userInfo');
    printError("called");
    box.put('number', formatLoginNumber(data[0]));
    box.put('email', email.text);
    printInfo("saved number");

    RegisterResponseModel response = await register(registerModel);
    if (response.code == 200) {
      goToSuccessPagege();
      showToastSuccess("user registered successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else if (response.code == 400) {
      Get.to(() => Login());
      showToastError('User Already exists please login');
    }
    update();
  }
}
