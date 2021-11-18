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

class PhoneController extends GetxController {
  TextEditingController phoneController = TextEditingController();
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> number;
  // getBills
  var isLoadingBills = true.obs;

  phoneMethod() async {
    print("here is the code");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills.toggle();
final SharedPreferences prefs = await _prefs;
number = prefs.setString("number", formatLoginNumber(phoneController.text)).then((bool success) {
  return number;
});
    print("code1");
    print(isLoadingBills);
   print(formatPhoneNumber(phoneController.text));
    PhoneModel phoneModel = PhoneModel(
      phone: formatPhoneNumber(phoneController.text),
    );
    PhoneResponseModel response = await phone(phoneModel);
    

    print(phoneModel.phone);
    if (response.code == 200 && response.data['detail'] == 'ok') {
      print(response.data['phone']);
      Get.to(() => Otp());
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
