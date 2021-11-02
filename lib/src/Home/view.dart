import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
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
                      Card(
                        elevation:5,
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
                              Text(
                                "REQUEST LOAN",
                                style: theme.textTheme.bodyText1!
                                    .copyWith(color: primaryColor, fontSize: 11),
                              ),
                              SvgPicture.asset("assets/images/forth.svg")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
