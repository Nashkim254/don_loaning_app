
import 'package:don/src/Home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {

  var isSelected = 0;

  Widget tab() {
    //provisions to check role and pick correct tabs
    return tabClient[isSelected];
  }

  updateSelected(index){
    print(index);
    isSelected = index;
    update();
    // return tabClient[index];
  }
  //Control User Action Dialogs
  implementDialogContext(Widget widget) async {
    Get.defaultDialog(

        title: "",
        titleStyle: TextStyle(fontSize: 0),
        radius: 10,
        contentPadding: EdgeInsets.all(20),
        barrierDismissible: true,
        content: widget);

  }

  //
  var tabClient = [
    HomeView(),
    TransactionsView(),
    PayBill(),
    ProfileView(),
  ];

  var tabAgent = [
  ];
}
