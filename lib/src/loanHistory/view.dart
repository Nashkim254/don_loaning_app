import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/dateformarter.dart';
import 'package:don/src/loanHistory/controller.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoansHistory extends StatelessWidget {
  LoansHistory({Key? key}) : super(key: key);
  static const routeName = '/history';
  final controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Loans History",
            style: theme.textTheme.bodyText1!.copyWith(
                color: blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Obx(() {
          if (controller.isLoadingHistory.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } 
          return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.historyList.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  leading: Icon(Icons.email, color: primaryColor),
                  title: Text(
                    "Received Ksh. ${controller.historyList[index].amount}",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Text(
                    f.format(controller.historyList[index].requestDate!).toString(),
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: blackColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                );
              });
        }
        )
        );
  }
}
