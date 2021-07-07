import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomView extends StatelessWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Order date",
          style: TextStyle(
            fontFamily: 'CircularStd',
            color: Color(0xff808080),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "07-06-2021",
          style: TextStyle(
            fontFamily: 'CircularStd',
            color: Color(0xff000000),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
