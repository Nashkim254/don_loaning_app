import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInOtpController extends GetxController {
  String text = '';
  bool _isLoading = false;
  bool _keyboardVisible = false;
  final TextEditingController otpController = TextEditingController();

  void onKeyboardTap(String value) {
    text = text + value;

    if (text.length == 6) {
      _keyboardVisible = true;
    } else {
      _keyboardVisible = false;
    }
    update();
  }

  validatorEmpty(String value) {
    if (otpController.text.isEmpty) {
      return "value connot be empty";
    }
  }
  updateSelect() {
    otpController.text = otpController.text.substring(0, otpController.text.length - 1);
    update();
  }
}
