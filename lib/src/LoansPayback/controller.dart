
import 'package:don/src/constants/constants.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/loan_payback_model.dart';
import 'package:don/src/navigation/view.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanRepayController extends GetxController {
  var isLoading= true.obs;
 Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? number;
  var result = ''.obs;
  var token;

readToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
 token = prefs.getString('token')!;
 update();
 return token;
}
  @override
  void onInit() {
    readToken();
    super.onInit();
  }

  loanRepayMethod(String token) async {
    print("Load...");
  //print("=========" + formatLoginNumber(username.text));
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoading.toggle();
   final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;
    printSuccess(formatLoginNumber(number!));
    LoanPayModel loanModel = LoanPayModel(
      amount:1000,
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

}
