import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/models/history_model.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:don/src/services/requests.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  var isLoadingHistory = true.obs;
var historyList = <History>[].obs;

  @override
  void onInit() {
    fetchHistory();
    super.onInit();
  }
void fetchHistory()async{
try {
  isLoadingHistory(true);
  var history = await fetchHis();
  if(history.isNotEmpty){
    historyList.assignAll(history);
  }
} finally {
  isLoadingHistory(false);
}
}

}
