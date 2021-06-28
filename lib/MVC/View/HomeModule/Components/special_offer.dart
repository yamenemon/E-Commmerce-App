import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: 20.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "images/Image Banner 2.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "images/Image Banner 3.png",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242.w,
          height: 100.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
