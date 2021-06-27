import 'package:ecommerce_app/MVC/Model/OnboardingModel/onBoardingModel.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var onPageIndex = 0.obs;
  bool get isLastPage => onPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  forward() {
    if (isLastPage) {
      //go to HomePage
      Get.offNamed(AppRoutes.HOMEPAGE);
    } else {
      pageController.nextPage(
          duration: 200.milliseconds, curve: Curves.bounceOut);
    }
  }

  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(
        imageAsset: 'images/splash_1.png',
        name: 'Welcome to Tokoto, Let’s shop!'),
    OnBoardingModel(
        imageAsset: 'images/splash_2.png',
        name:
            'We help people conect with store \naround United State of America'),
    OnBoardingModel(
        imageAsset: 'images/splash_3.png',
        name: 'We show the easy way to shop. \nJust stay at home with us'),
  ];
}
