
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/user_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
 User? user;
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
    fetchUser(token);
    printSuccess(token);
    printSuccess(user);
    super.onInit();
    update();
  }
 fetchUser(String token)async{
try {

  printSuccess("This is your key right" + token);
  isLoading(true);
   user = await getUser(token);
  printSuccess("Your user  $user");
    printSuccess("Dataaaaa=> $user");
    update();
    return user;
} finally {
  isLoading(false);
}
}

}
