import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.17,
      width: double.infinity,
      margin: EdgeInsets.all(15.w),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        color: Colors.teal[500], //const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text.rich(
            TextSpan(
              style: const TextStyle(color: Colors.white),
              children: [
                // TextSpan(
                //   text: "A Summer Surprise\n",
                //   style: TextStyle(
                //     fontSize: 18.sp,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                TextSpan(
                    text: "20%\n",
                    style: GoogleFonts.poppins(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[800],
                    )),
                TextSpan(
                    text: "CASHBACK",
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Lottie.asset(
            'images/cashbackLotti.json',
            width: Get.width * 0.35,
            height: Get.width * 0.35,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
