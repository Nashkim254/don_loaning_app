import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? number;
  var result = ''.obs;
  var isLoading = true.obs;
  var data = Get.arguments;
  getUser() async {
    isLoading(true);
    final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;
isLoading(false);
    update();
    return number;
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
