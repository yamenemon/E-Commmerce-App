import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            margin: EdgeInsets.fromLTRB(0.h, 0.w, 0.w, 25.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/no-internet.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            "No Internet Connection",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "You are not connected to the internet. Make sure Wi-Fi is on, Airplane Mode is Off and try again.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
