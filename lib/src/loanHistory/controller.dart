import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/history_model.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController {
  var isLoadingHistory = true.obs;
var historyList = List<History>.empty().obs;
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
  void onInit() async{
     box = await Hive.openBox('userInfo');
  printSuccess("read token from box");
 token = box.get('token')!;
    readToken();
    printError("not token: $token");
    fetchHistory(token);
    super.onInit();
  }
 Future<void> fetchHistory(String token)async{
printInfo("loaaading...");
  isLoadingHistory.value = true;
  historyList.clear();
  printInfo("cleared...");
  printSuccess(token);
  var history = await fetchHis(token);
  printSuccess("this is history $history");
  printInfo("fetched...");
  isLoadingHistory.value = false;
      printSuccess("Reached here");
  printSuccess(history);
  if(history.isNotEmpty){
    history.forEach((item){
      historyList.add(History.fromJson(item.toJson()));
    });
    printSuccess("Reached here");
    printSuccess(historyList);
    update();
  }
   History getDetails(int index){
    return historyList[index];
  }
} 
}

