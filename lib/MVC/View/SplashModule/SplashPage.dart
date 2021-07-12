import 'dart:async';
import 'package:ecommerce_app/MVC/Controller/OnBoardingModule/OnboardingController.dart';
import 'package:ecommerce_app/MVC/View/SplashModule/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final OnBoardingController _onBoardingController =
      Get.put(OnBoardingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_onBoardingController.onBoardingPages.length - 2 ==
          _onBoardingController.onPageIndex.value) {
        timer.cancel();
      }
      _onBoardingController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.9,
              width: 412.w,
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}
