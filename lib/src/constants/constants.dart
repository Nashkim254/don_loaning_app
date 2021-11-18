//Static Strings
import 'package:flutter/material.dart';

const String appName = "Don";

//Animation values below
const Duration duration200 = Duration(milliseconds: 200);
const Duration duration400 = Duration(milliseconds: 400);
const Duration duration600 = Duration(milliseconds: 600);
const Duration duration800 = Duration(milliseconds: 800);
const Duration duration1000 = Duration(milliseconds: 1000);
const Duration duration1200 = Duration(milliseconds: 1200);

//Spacing values Below
const double space150 = 150.0;
const double space100 = 100.0;
const double space50 = 50.0;
const double space40 = 40.0;
const double space30 = 30.0;
const double space25 = 25.0;
const double space20 = 20.0;
const double space15 = 15.0;
const double space10 = 10.0;
const double space5 = 5.0;
const double space7 = 7.0;
const double space2 = 2.5;
const double space1 = 1.0;

// Full screen width and height
Future<double> getScreenWidthSize(context) async {
  return MediaQuery.of(context).size.width;
}

// Full screen height
Future<double> getScreenHeightSize(context) async {
  return MediaQuery.of(context).size.height;
}

/// Valid phone number
String formatPhoneNumber(String number) {
  String phoneNumber = number.replaceAll(" ", "");

  if (phoneNumber.startsWith("+")) phoneNumber = phoneNumber;

  if (phoneNumber.startsWith("0"))
    phoneNumber = phoneNumber.replaceFirst("0", "+254");

    if (phoneNumber.startsWith("254"))
    phoneNumber = phoneNumber.replaceFirst("254", "+254");

  if (phoneNumber.startsWith("7") || phoneNumber.startsWith("1"))
    phoneNumber = "+254$phoneNumber";

  return phoneNumber;
}
String formatLoginNumber(String number) {
  String phoneNumber = number.replaceAll(" ", "");

  

  if (phoneNumber.startsWith("0"))
    phoneNumber = phoneNumber.replaceFirst("0", "254");

    if (phoneNumber.startsWith("+254"))
    phoneNumber = phoneNumber.replaceFirst("+254", "254");

  if (phoneNumber.startsWith("7") || phoneNumber.startsWith("1"))
    phoneNumber = "254$phoneNumber";

  return phoneNumber;
}
String? validatorEmpty(String value) {
  if (value.isEmpty) {
    return 'Required field';
  }
  return null;
}

initToken() {
  List<int> token =  List<int>.filled(20, 0, growable: false);
  // List<int> token = new List<int>(20);
  int b = 16;
  for (int a = 0; a < 20; a++) {
    int c = (b ~/ 2);
    token[a] = ((b | ((a + c) >> b)) << 4);
    b++;
  }
  String f = String.fromCharCodes(token);
  return f;
}
