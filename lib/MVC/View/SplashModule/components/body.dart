import 'package:ecommerce_app/MVC/Controller/OnBoardingModule/OnboardingController.dart';
import 'package:ecommerce_app/MVC/View/SplashModule/components/splashContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  OnBoardingController _onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
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
                  image:
                      _onBoardingController.onBoardingPages[index].imageAsset!,
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        _onBoardingController.onBoardingPages.length,
                        (index) => Obx(
                          () {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color:
                                      _onBoardingController.onPageIndex.value ==
                                              index
                                          ? Colors.black
                                          : Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                            );
                          },
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                    GestureDetector(
                      onTap: _onBoardingController.forward,
                      child: CircleAvatar(
                        radius: 35,
                        child: Obx(
                          () {
                            return Text(_onBoardingController.isLastPage
                                ? 'Start'
                                : 'Next');
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
