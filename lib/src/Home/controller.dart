import 'package:don/src/helpers/toasts.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  String? number;
  var result = ''.obs;
  var isLoading = true.obs;
  var data = Get.arguments;
  var box;
  var name= "user";
 


  @override
  void onInit() {
    getUser();
    super.onInit();
    update();
  }
   getUser() async {
    box = await Hive.openBox('userInfo');
    printSuccess("Just called user");
    if(box.get('number')!=null){
    name = box.get('number');
    }
    update();
  }
}
