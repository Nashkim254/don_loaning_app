import 'package:don/src/LoanApplication/controller.dart';
import 'package:don/src/constants/colors.dart';
import 'package:don/src/helpers/toasts.dart';
import 'package:don/src/transitions/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoanApplication extends StatelessWidget {
  LoanApplication({Key? key}) : super(key: key);
  static const routeName = '/request';
  final controller = Get.put(RequestLoan());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: blackColor),
              onPressed: () => Get.back()),
          title: Text(
            "Loan Application",
            style: theme.textTheme.bodyText1!.copyWith(
                color: blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: Obx(() {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Easy Steps",
                    style: theme.textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),

                  SizedBox(height: 26.h),
                  ListTile(
                      leading: Container(
                        height: 21.h,
                        width: 21.w,
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "1",
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: cardLightColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      title: Text(
                        "Enter the amount you wish to apply",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 26.h),
                  ListTile(
                      leading: Container(
                        height: 21.h,
                        width: 21.w,
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "2",
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: cardLightColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      title: Text(
                        "Download the form below,",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 23.h),
                  ListTile(
                      leading: Container(
                        height: 21.h,
                        width: 21.w,
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "3",
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: cardLightColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      title: Text(
                        "Fill the required information for loan application and upload the form",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 23.h),
                  ListTile(
                      leading: Container(
                        height: 21.h,
                        width: 21.w,
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "4",
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: cardLightColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      title: Text(
                        "Loan Approval",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 23.h),
                  ListTile(
                      leading: Container(
                        height: 21.h,
                        width: 21.w,
                        color: primaryColor,
                        child: Center(
                          child: Text(
                            "5",
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: cardLightColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      title: Text(
                        "Receive the loan",
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      )),
                         SizedBox(height: 20.h),
              const Text(
                "Enter the amount you wish to Apply, Ksh:",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left:20.w,right:20.w),
                child: TextField(
                  style: theme.textTheme.bodyText1,
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: controller.amountCont,
                ),
              ),
              SizedBox(height: 20.h),
                  SizedBox(height: 45.h),
                  ShakeTransition(
                    child: Padding(
                      padding: EdgeInsets.only(left: 90.w, right: 90.w),
                      child: Card(
                        elevation: 5,
                        child: GestureDetector(
                          onTap: () {
                            controller.openFile(
                              url:
                                  "https://donstatic.s3.amazonaws.com/loan_form.pdf",
                              fileName: 'file.pdf',
                            );
                          },
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: cardLightColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.isLoading.value ? 
                                  const Center(
                                    child:CircularProgressIndicator(strokeWidth: 1,)):
                                  Text(
                                    "DOWNLOAD LOAN FORM",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                      color: primaryColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Icon(Icons.download, color: primaryColor))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ShakeTransition(
                    child: Padding(
                      padding: EdgeInsets.only(left: 90.w, right: 90.w),
                      child: Card(
                        elevation: 5,
                        child: GestureDetector(
                          onTap: () {
                            print(controller.token);
                            controller.uploadFile(controller.file,controller.token);
                            // Navigator.pushNamed(context, '/request');
                          },
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
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
                                    "UPLOAD LOAN FORM",
                                    style: theme.textTheme.bodyText1!.copyWith(
                                      color: primaryColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.upload, color: primaryColor))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                    SizedBox(height: 40.h,),
                   ShakeTransition(
                    child: Padding(
                      padding: EdgeInsets.only(left: 90.w, right: 90.w),
                      child: Card(
                        elevation: 5,
                        child: GestureDetector(
                          onTap: () {
                            if(controller.amountCont.text==''){
                              showToastError("Amount field is empty");
                            }else{
                            controller.applyLoan(controller.file,controller.token);
                            }
                            // Navigator.pushNamed(context, '/request');
                          },
                          child: Container(
                            height: 30.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: primaryColor,
                            ),
                            child:
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: controller.isLoadingApp.value ? Center(child:CircularProgressIndicator(color: cardLightColor,)):
                                    Text(
                                      "Apply Loan",
                                      style: theme.textTheme.bodyText1!.copyWith(
                                        color: cardLightColor,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                ],
              ),
            );
          }
        ));
  }
}
