
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
  @override
  void onInit() {
    super.onInit();
  }

  loanRepayMethod() async {
    print("Load...");
  //print("=========" + formatLoginNumber(username.text));
    Get.dialog(CustomDialog(), barrierDismissible: false);
    isLoading.toggle();
   final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;
    LoanPayModel loanModel = LoanPayModel(
      amount:"10",
      phone: formatPhoneNumber(result.value)
    );
    LoanPayResponseModel response = await loanRepay(loanModel);
    print("code 2");

    print(response.data);
    if (response.code == 200) {
      //Get.offAll(const NavigationView(), arguments: [number]);
      showToastSuccess("Paid in successfully");
      // Get.to(FetchedInvoiceView(), arguments: [bill]);
    } else if (response.code == 400) {
      print(response.code);
      print(response.data['error']);

      showToastError('${response.data['non_field_errors']}');
    }
    update();
  }

}
