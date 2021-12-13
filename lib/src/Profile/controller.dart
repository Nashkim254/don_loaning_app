
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/user_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
String? number;
  var result = ''.obs;
  var data = Get.arguments;
  var box;
  var name= "user";
 var token;
var email;

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
    email = box.get('email');
    }
    update();
  }

}
