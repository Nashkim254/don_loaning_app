import 'package:don/src/ForgotPassword/view.dart';
import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/registration/otp/view.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/models/phone_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneResetController extends GetxController {
  TextEditingController phoneresetController = TextEditingController();
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> number;
  // getBills
  var isLoadingBills = true.obs;

  phoneresetMethod() async {
    print("here is the code");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills(true);
final SharedPreferences prefs = await _prefs;
number = prefs.setString("number", formatPhoneNumber(phoneresetController.text)).then((bool success) {
  return number;
});
    print("code1");
    print(isLoadingBills);
   print(formatPhoneNumber(phoneresetController.text));
    PhoneModel phoneModel = PhoneModel(
      phone: formatPhoneNumber(phoneresetController.text),
    );
    PhoneResponseModel response = await requestResetCode(phoneModel);
    

    print(phoneModel.phone);
    if (response.code == 200 && response.data['detail'] == 'ok') {
      print(response.data['phone']);
      Get.to(() => ResetPassword());
      showToastSuccess("Code Sent successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else {
      print(response.code);
      print(response.data['error']);

      showToastError('Invoice Number not found');
      showToast('Invoice Number not found');
    }
    update();
  }
}
