import 'package:don/src/Home/controller.dart';
import 'package:don/src/LoanApplication/view.dart';
import 'package:don/src/LoansPayback/view.dart';
import 'package:don/src/Profile/view.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/loanHistory/view.dart';
import 'package:don/src/navigation/controller.dart';
import 'package:don/src/notifications/view.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
   HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
final controller = Get.put(HomeController());
 final navigationController = Get.put(NavigationController());
Future<void> initSocket()async{
  printSuccess("Connecting to service");
IO.Socket socket = IO.io('wss://api.luchian.co.ke/ws/notify/${controller.number}', 
    IO.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .disableAutoConnect()  // disable auto-connection
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build()
  );
socket.connect();
socket.onConnect((data) => printSuccess("connected"));

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUserFromHive();
    //controller.fetchUser(controller.token);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: pinBackgroundColor,
        appBar: AppBar(
          leading: Image.asset("assets/images/logo.png"),
          title:  GetBuilder<HomeController>(
            init: HomeController(),
            builder: (context) {
              
              return controller.isLoading.value ? const Text("") :Text(
                        "Hi, ${controller.userdetails['username']}",
                        style: theme.textTheme.bodyText1!.copyWith(),
                   
              );
            }
          ),
            
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(Notifications());
                },
              child: Image.asset("assets/images/notify.png")),
            GestureDetector(
              onTap: (){
                Get.to(ProfileView());
              },
              child: Image.asset("assets/images/prof.png"))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 29),
                child: Container(
                  height: 160.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 17.0, left: 20),
                        child: Text("Loan Limit",
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: cardLightColor, fontSize: 14)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9.0, left: 20),
                        child: Text("Ksh. 70,000.00",
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: cardLightColor, fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 21.0, left: 20),
                        child: Text("In need of cash?",
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: cardLightColor, fontSize: 18)),
                      ),
                      ShakeTransition(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Card(
                            elevation: 5,
                            child: GestureDetector(
                              onTap: (){
                                Get.to(LoanApplication());
                              },
                              child: Container(
                                height: 30.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: cardLightColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "REQUEST LOAN",
                                        style: theme.textTheme.bodyText1!
                                            .copyWith(
                                                color: primaryColor,
                                                fontSize: 11),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/images/forth.png"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 23.h, left: 30.w),
                child: Text(
                  "Quick Actions",
                  style: theme.textTheme.bodyText2!.copyWith(
                    color: blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShakeTransition(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(LoansHistory());
                        },
                        child: Container(
                          height: 89.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                              color: cardLightColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: Image.asset("assets/images/list.png"),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.w, top: 11.h),
                                      child: Text(
                                        "View Loans\nHistory",
                                        style:
                                            theme.textTheme.bodyText2!.copyWith(
                                          color: primaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset("assets/images/forth.png"),
                                    )
                                  ])
                            ],
                          ),
                        ),
                      ),
                    ),
                    ShakeTransition(
                      child: GestureDetector(
                        onTap: (){
                          Get.to(LoansPayback());
                        },
                        child: Container(
                            height: 89.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                                color: cardLightColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12.h),
                                child: SizedBox(
                                    height: 31.h,
                                    width: 31.w,
                                    child: Image.asset(
                                        "assets/images/efficient.png")),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.w, top: 11.h),
                                      child: Text(
                                        "Repay Due\nLoans",
                                        style:
                                            theme.textTheme.bodyText2!.copyWith(
                                          color: primaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset("assets/images/forth.png"),
                                    )
                                  ])
                            ])),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 33.h, left: 30.w),
                  child: SvgPicture.asset("assets/images/dash.svg")),
            ],
          ),
        ));
  }
}
