import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "images/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "images/Bill Icon.svg", "text": "Bill"},
      {"icon": "images/Game Icon.svg", "text": "Game"},
      {"icon": "images/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "images/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: Get.height * 0.07,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.w),
              height: Get.height * 0.07,
              width: Get.height * 0.07,
              decoration: BoxDecoration(
                color: kPrimaryColor, //const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                icon,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.h),
            Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
