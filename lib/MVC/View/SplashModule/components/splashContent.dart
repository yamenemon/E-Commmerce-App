import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashContent extends StatelessWidget {
  SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: 36.sp,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: 265.h,
          width: 235.w,
        ),
      ],
    );
  }
}
