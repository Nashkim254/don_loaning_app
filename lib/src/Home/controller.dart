import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? number;
  var result = ''.obs;
  getUser() async {
    final SharedPreferences prefs = await _prefs;
    number = prefs.getString("number");
    result.value = number!;

    update();
    return result.value;
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
