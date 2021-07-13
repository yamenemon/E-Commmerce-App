import 'package:ecommerce_app/MVC/Controller/OnBoardingModule/OnboardingController.dart';
import 'package:ecommerce_app/MVC/View/SplashModule/components/splashContent.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final OnBoardingController _onBoardingController =
      Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _onBoardingController.pageController,
              onPageChanged: _onBoardingController.onPageIndex,
              itemCount: _onBoardingController.onBoardingPages.length,
              itemBuilder: (context, index) => SplashContent(
                image: _onBoardingController.onBoardingPages[index].imageAsset!,
                text: _onBoardingController.onBoardingPages[index].name!,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      _onBoardingController.onBoardingPages.length,
                      (index) => Obx(
                        () {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            height: 10.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                                color:
                                    _onBoardingController.onPageIndex.value ==
                                            index
                                        ? Colors.grey
                                        : kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                      ),
                    ),
                  ),
                  const Spacer(flex: 8),
                  SizedBox(
                    width: Get.width - 100,
                    height: 56.h,
                    child: TextButton(
                      style: GlobalWidget.buttonStyle(),
                      onPressed: _onBoardingController.forward,
                      child: Obx(
                        () => Text(
                          _onBoardingController.isLastPage
                              ? "Start"
                              : "Continue",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
