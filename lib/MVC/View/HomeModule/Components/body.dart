import 'package:ecommerce_app/MVC/View/HomeModule/Components/special_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
    );
  }
}
