import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/user_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  String? number;
  var result = ''.obs;
  var isLoading = true.obs;
  var data = Get.arguments;
  var box;
  var name= "user";
  var userdetails;
 

var token;

readToken() async {
  box = await Hive.openBox('userInfo');
  printSuccess("read token from box");
 token = box.get('token')!;
 printSuccess(token);
 update();
 return token;
}

  @override
  void onInit() async{
     box = await Hive.openBox('userInfo');
  printSuccess("read token from box");
 token = box.get('token')!;
    readToken();
    getUserFromHive();
    printError("not token: $token");
    fetchUser(token);
    super.onInit();
    update();
  }
   getUserFromHive() async {
    box = await Hive.openBox('userInfo');
    printSuccess("Just called user");
    if(box.get('number')!=null){
    name = box.get('number');
    }
    update();
  }


 fetchUser(String token)async{
try {

  printSuccess("This is your key right" + token);
  isLoading.value = true;
 var  user = await getUser(token);
 printError("fetched");
 printSuccess(user);
 printWarning("this is your user");
    userdetails = user;
    printWarning("user is here");
    printSuccess(userdetails['username']);
    update();
    return userdetails;
} finally {
  isLoading.value=false;
}
}
}
