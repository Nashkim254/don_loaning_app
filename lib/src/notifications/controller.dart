import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/notifications_model.dart';
import 'package:don/src/notifications/view.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationController extends GetxController {
  var isLoading = true.obs;
var notificationList = <Notification>[].obs;
var token;
var box;

readToken() async {
  box = await Hive.openBox('userInfo');
  printSuccess("read token from box");
 token = box.get('token')!;
 printSuccess(token);
 update();
 return token;
}
  @override
  void onInit() {
    
    readToken();
    fetchNotifications(token);
    super.onInit();
  }
Future<void> fetchNotifications(String token)async{


  printSuccess("This is your key" + token);
  isLoading.value=true;
  var notification = await notify(token);
  printSuccess("Your notification  $notification");
 notification.forEach((items){
notificationList.add(Notification.fromJson(items.toJson()));
  });
  isLoading.value = false;

}
  Notification getDetails(int index){
    return notificationList[index];
  }
}
