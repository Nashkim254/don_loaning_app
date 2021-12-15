import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/dateformarter.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/loanHistory/controller.dart';
import 'package:don/src/registration/otp/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoansHistory extends StatefulWidget {
  LoansHistory({Key? key}) : super(key: key);
  static const routeName = '/history';

  @override
  State<LoansHistory> createState() => _LoansHistoryState();
}

class _LoansHistoryState extends State<LoansHistory> {
  final controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: pinBackgroundColor,
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
          } else if (controller.historyList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No history",
                    style: TextStyle(fontSize: 14.sp, color: blackColor),
                  ),
                  SizedBox(height: 20.h,),
                  SvgPicture.asset("assets/images/his.svg")
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: _pullRefresh,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.historyList.length,
                itemBuilder: (context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.email, color: primaryColor),
                      title: Text(
                        "Applied for Ksh. ${controller.historyList[index].amount}",
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
                    ),
                  );
                }),
          );
        }
        )
        );
  }

   Future<void> _pullRefresh() async {
     setState(() {
      controller.fetchHistory(controller.token);
     });
    
  }
}
