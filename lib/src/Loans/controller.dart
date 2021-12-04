
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/history_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanController  extends GetxController{
 var isLoadingHistory = true.obs;
var historyList = <History>[].obs;
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
    fetchHistory(token);
    super.onInit();
  }
void fetchHistory(String token)async{
try {

  printSuccess("This is your key" + token);
  isLoadingHistory(true);
  var history = await fetchHis(token);
  printSuccess(history);
  if(history.isNotEmpty){
    historyList.assignAll(history);
    printSuccess("Dataaaaa=> ${historyList}");
  }
} finally {
  isLoadingHistory(false);
}
}
}