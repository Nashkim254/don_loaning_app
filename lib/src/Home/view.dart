import 'package:don/src/constants/colors.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: pinBackgroundColor,
        appBar: AppBar(
          backgroundColor: pinBackgroundColor,
          leading: SvgPicture.asset("assets/images/logohome.svg"),
          title: Text(
            "Hi, John Doe",
            style: theme.textTheme.bodyText1!.copyWith(),
          ),
          actions: [
            SvgPicture.asset("assets/images/notify.svg"),
            SvgPicture.asset("assets/images/profile.svg")
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                        child: Text("Ksh. 10,000.00",
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
                          padding:  EdgeInsets.only(left:18.0),
                          child: Card(
                            elevation: 5,
                            child: Container(
                              height: 30.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: cardLightColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "REQUEST LOAN",
                                      style: theme.textTheme.bodyText1!.copyWith(
                                          color: primaryColor, fontSize: 11),
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/forth.svg")
                                ],
                              ),
                            ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShakeTransition(
                            child: Container(
                              height: 89.h,
                              width: 140.w,
                              decoration: BoxDecoration(
                                  color: cardLightColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  SvgPicture.asset("assets/images/list.svg"),
                                  Row(children: [
                                    Text(
                                      "View Loans\nHistory",
                                      style:
                                          theme.textTheme.bodyText2!.copyWith(
                                        color: primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SvgPicture.asset("assets/images/forth.svg")
                                  ])
                                ],
                              ),
                            ),
                          ),
                          ShakeTransition(
                            child: Container(
                                height: 89.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                    color: cardLightColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  SvgPicture.asset("assets/images/list.svg"),
                                  Row(children: [
                                    Text(
                                      "Repay Due\nLoans",
                                      style:
                                          theme.textTheme.bodyText2!.copyWith(
                                        color: primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SvgPicture.asset("assets/images/forth.svg")
                                  ])
                                ])),
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 33.h, left: 30.w),
                          child: SvgPicture.asset("assets/images/dash.svg")),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
