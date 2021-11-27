import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/notifications_model.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController extends GetxController {
  var isLoading = true.obs;
var notificationList = <Notification>[].obs;
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
  isLoading(true);
  var notification = await notify(token);
  printSuccess("Your notification  $notification");
  if(notification.isNotEmpty){
    notificationList.assignAll(notification);
    printSuccess("Dataaaaa=> ${notificationList}");
  }
} finally {
  isLoading(false);
}
}

}
