import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.all(20.w),
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
        width: 55.w,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.w),
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
