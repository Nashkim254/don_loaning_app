import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/registration/otp/view.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/models/phone_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PhoneController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  late Future<String> number;
  var box;
  // getBills
  var isLoadingBills = true.obs;
@override
void onInit()async{
  super.onInit();
    box = await Hive.openBox('userInfo');
}
  phoneMethod() async {
    print("here is the code");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills.toggle();
    box = await Hive.openBox('userInfo');
    box.put("number", phoneController.text);
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
