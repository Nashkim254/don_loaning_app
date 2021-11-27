import 'package:don/src/constants/colors.dart';
import 'package:don/src/notifications/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
   Notifications({Key? key}) : super(key: key);
  static const routeName = '/notifications';
  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Notifications",
            style: theme.textTheme.bodyText1!.copyWith(
                color: blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Obx((){
          if(controller.isLoading.value){
            return const  Center(child: CircularProgressIndicator(),);
          }else if (controller.notificationList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Notifications",
                  style: TextStyle(fontSize: 14.sp, color: blackColor),
                ),
                SizedBox(height: 20.h,),
                SvgPicture.asset("assets/images/not.svg")
              ],
            ),
          );
        }
            return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notificationList.length,
            itemBuilder: (context, int index) {
              return  
            ListTile(
              leading: Image.asset("assets/images/logo.png"),
              title: Text(
              '${controller.notificationList[index].description}',
                style: theme.textTheme.bodyText1!.copyWith(
                    color: blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            );
            });
        }));
  }
}
