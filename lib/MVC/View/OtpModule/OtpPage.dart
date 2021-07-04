import 'package:ecommerce_app/MVC/Controller/OtpController/OtpController.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/Util/Language/LocalizationLanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../globalWidget.dart';

class OtpPage extends StatefulWidget {
  OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpController _otpController = Get.put(OtpController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _otpController.otp = Get.arguments![0];
    _otpController.name = Get.arguments![1];
    _otpController.phoneNumber = Get.arguments![2];
    _otpController.address = Get.arguments![3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: kSignInScaffoldColor,
            child: Stack(
              children: [
                Container(
                  height: 198.h,
                  width: 412.w,
                  child: Image.asset("images/signin_bc.png"),
                ),
                Positioned(
                  child: GlobalWidget.signInglobalAppBar(
                    title: "",
                    bgColor: Colors.transparent,
                    trailing: Text(""),
                  ),
                ),
                Positioned(
                  top: 110.h,
                  left: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(LocalizationLanguage.OTP_TEXT.tr,
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontFamily: "CircularStd",
                              fontStyle: FontStyle.normal,
                              fontSize: 22.sp),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 5.h,
                      ),
                      Opacity(
                        opacity: 0.7035679817199707,
                        child: Container(
                          child: Text(
                            LocalizationLanguage.OTP_BAN_TEXT.tr,
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                fontFamily: "CircularStd",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: Text(
              LocalizationLanguage.SENT_TEXT.tr,
              style: TextStyle(
                fontFamily: 'CircularStd',
                color: Color(0xff000000),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15.r),
                fieldHeight: 60.h,
                fieldWidth: 55.w,
                activeColor: Color(0xfff2f2f2),
                activeFillColor: Color(0xfff2f2f2),
                inactiveColor: Color(0xfff2f2f2),
                inactiveFillColor: Color(0xfff2f2f2),
                // selectedFillColor: Colors.blue[900],
                borderWidth: 0.sp,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: kWhiteColor,
              enableActiveFill: true,
              // errorAnimationController: errorController,
              // controller: textEditingController,
              onCompleted: (v) {
                if (v == _otpController.otp) {
                  print("valid pin");
                } else {
                  print("invalid pin");
                }

                print("Completed :: $v");
              },
              onChanged: (value) {
                _otpController.onChangedOtp(value);
              },
            ),
          ),

          // Resend OTP
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: Row(
              children: [
                Container(
                  child: Text(
                    LocalizationLanguage.RESENT_OTP_TEXT.tr,
                    style: TextStyle(
                        color: const Color(0xffd12e22),
                        fontWeight: FontWeight.w500,
                        fontFamily: "CircularStd",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            child: InkWell(
              onTap: () {
                _otpController.isValid == true
                    ? Get.offAndToNamed(AppRoutes.PAYMENT_PAGE)
                    : print("invalid");
              },
              child: Obx(
                () => Container(
                  width: 372.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    ),
                    color: _otpController.btColor == true
                        ? kPrimaryColor
                        : Color(0xffbcbcbc),
                  ),
                  child: Center(
                    child: Text(LocalizationLanguage.VERIFY_NOW_TEXT.tr,
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "CircularStd",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
