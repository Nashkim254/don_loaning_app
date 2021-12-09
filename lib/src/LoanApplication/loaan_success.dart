import 'package:don/src/constants/colors.dart';
import 'package:don/src/navigation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoanSuccess extends StatelessWidget {
  const LoanSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: pinBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardLightColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: blackColor),
        ),
        title: Text("Application Result",
            style: theme.textTheme.headline5!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: blackColor)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Loan Application recieved",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            SvgPicture.asset("assets/images/loanSuccess.svg"),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "We have received your application,\nplease wait you will receive a response\n       through the app and SMS",
              style: TextStyle(fontSize: 14.sp, color: blackColor),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const NavigationView());
              },
              child: Image.asset("assets/images/go.png"),
            ),
          ],
        ),
      ),
    );
  }
}
