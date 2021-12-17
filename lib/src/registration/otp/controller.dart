import 'package:don/src/Home/view.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/otp_model.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/registration/register/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OtpController extends GetxController {
  String text = '';
  bool _isLoading = false;
  bool _keyboardVisible = false;
  final TextEditingController otpController = TextEditingController();
  var data = Get.arguments;
  String? number;
  var box;
  var result = ''.obs;
  void onKeyboardTap(String value) {
    otpController.text =otpController.text + value;
    if (otpController.text.length == 6) {
      otpMethod();
    }
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    box = await Hive.openBox('userInfo');
  }

  updateSelect() {
    otpController.text =
        otpController.text.substring(0, otpController.text.length - 1);
    update();
  }

  validatorEmpty(String value) {
    if (otpController.text.isEmpty) {
      return "value connot be empty";
    }
  }

  // getBills
  var isLoadingBills = true.obs;

  otpMethod() async {
    print("verifying...");
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoadingBills.toggle();
    box = await Hive.openBox('userInfo');
    number = box.get("number");
    result.value = number!;
    print("code1");
    print(isLoadingBills);
    print(text);
    OtpModel otpModel = OtpModel(
      code: otpController.text,
      phone: formatPhoneNumber(number!),
    );
    OtpResponseModel response = await verifyOtp(otpModel);
    print("code 2");

    print(response.code);
    if (response.code == 200 && response.data['verified'] == true) {
      print(response.data['username']);
      Get.to(() => Register(), arguments: [otpModel.phone]);
      showToastSuccess("user verified successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    }else if(response.code==400){
      Get.back();
      showToastError(response.data['code']);
    } else {
      Get.back();
      showToastError('Error occured');
    }
    update();
  }
}

class CustomDialog extends StatelessWidget {
  CustomDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      height: 220,
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: Color(0xffF0642F),
              shape: BoxShape.circle,
            ),
            child: Center(
                child: SpinKitWanderingCubes(
                    shape: BoxShape.circle, color: primaryColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              "Processing",
              style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
