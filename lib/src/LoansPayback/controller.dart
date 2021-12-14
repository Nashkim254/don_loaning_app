
import 'package:don/src/Home/controller.dart';
import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/loan_payback_model.dart';
import 'package:don/src/models/transaction_model.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/services/requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoanRepayController extends GetxController {
  TextEditingController amountCont = TextEditingController();
    TextEditingController transCont = TextEditingController();
    final controller = Get.put(HomeController());
  var isLoading= true.obs;
  var number;
  var result = ''.obs;
  var token;
  var box;

readToken() async {
  box = await Hive.openBox('userInfo');
  printSuccess("read token from box");
 token = box.get('token')!;
 printSuccess(token);
 update();
 return token;
}
 getUser() async {
    box = await Hive.openBox('userInfo');
    printSuccess("Just called user");
    if(box.get('number')!=null){
    number = box.get('number');
    }
    update();
  }
  @override
  void onInit() async{
    box = await Hive.openBox('userInfo');
    readToken();
    getUser();
    super.onInit();
  }

  loanRepayMethod(String token) async {
    printSuccess("Load...");
  //print("=========" + formatLoginNumber(username.text));
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoading.toggle();
    box = await Hive.openBox('userInfo');
    number = controller.userdetails['username'];
    printSuccess("We got the number");
    printSuccess(formatLoginNumber(number!));
    printSuccess(amountCont.text);
    printSuccess(number);
    LoanPayModel loanModel = LoanPayModel(
      amount:int.parse(amountCont.text),
      phone: formatPhoneNumber(number!)
    );
    LoanPayResponseModel response = await loanRepay(loanModel,token);
    print("code 2");

    print(response.data);
    if (response.code == 200) {
      //Get.offAll(const NavigationView(), arguments: [number]);
      Get.back();
      showToastSuccess("Paid in successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else if (response.code == 400) {
      print(response.code);
      print(response.data['error']);

      showToastError('${response.data['non_field_errors']}');
    }else if(response.code == 401){
      printError(token);
      Get.back();
      showToastError("${response.data['detail']}");
    }
    update();
  }


  //transaction code
  transMethod(String token) async {
    printSuccess("Load...");
  //print("=========" + formatLoginNumber(username.text));
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoading.toggle();
    box = await Hive.openBox('userInfo');
    number = box.get("number");
    printSuccess(formatLoginNumber(number!));
    printSuccess(amountCont.text);
    TransModel loanModel = TransModel(
      transaction_id: transCont.text,
    );
    TransResponseModel response = await transRepay(loanModel,token);
    print("code 2");

    print(response.data);
    if (response.code == 200) {
      //Get.offAll(const NavigationView(), arguments: [number]);
      Get.back();
      showToastSuccess("Transaction completed successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else if (response.code == 400) {
        Get.back();
      showToastError('${response.data['non_field_errors']}');
    }else if(response.code == 401){
      printError(token);
      Get.back();
      showToastError("${response.data['detail']}");
    }
    update();
  }

}
