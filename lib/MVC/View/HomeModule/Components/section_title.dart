import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.poppins(
                fontSize: 18.sp, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
