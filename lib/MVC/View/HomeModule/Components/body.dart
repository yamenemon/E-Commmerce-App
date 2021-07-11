import 'package:ecommerce_app/MVC/Controller/ConnectivityController.dart';
import 'package:ecommerce_app/MVC/Controller/GetController.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/special_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  final GetController _getController = Get.find<GetController>();
  final ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            _connectivityController.isOnline == true
                ? _getController.fetchGetData()
                : "";
          });
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  HomeHeader(),
                  DiscountBanner(),
                  Categories(),
                  SpecialOffers(),
                  SizedBox(height: 15.h),
                  PopularProducts(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
