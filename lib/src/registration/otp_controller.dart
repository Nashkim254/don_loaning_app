import 'package:don/src/Home/view.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/navigation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PinController extends GetxController {
  String text = '';
  bool _isLoading = false;
  bool _keyboardVisible = false;
  final TextEditingController otpController = TextEditingController();

  void onKeyboardTap(String value) {
    text = text + value;
    if (text.length == 4) {
      Get.dialog(CustomDialog(), barrierDismissible: false);
      Future.delayed(const Duration(seconds: 3), () => Get.to(NavigationView()));
    }
    update();
  }

  updateSelect() {
    text = text.substring(0, text.length - 1);
    update();
  }

  validatorEmpty(String value) {
    if (otpController.text.isEmpty) {
      return "value connot be empty";
    }
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
            decoration: BoxDecoration(
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
