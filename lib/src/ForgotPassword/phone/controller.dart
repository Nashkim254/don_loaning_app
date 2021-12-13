import 'package:don/src/ForgotPassword/view.dart';
import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/models/phone_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PhoneResetController extends GetxController {
  TextEditingController phoneresetController = TextEditingController();
  late Future<String> number;
  // getBills
  var isLoadingBills = true.obs;
  var box;
  @override
  void onInit() async {
    box = await Hive.openBox('userInfo');
    super.onInit();
  }

  phoneresetMethod() async {
    print("here is the code");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills(true);
    box = await Hive.openBox('userInfo');
    box.put(
      'number',
      formatPhoneNumber(phoneresetController.text),
    );
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
