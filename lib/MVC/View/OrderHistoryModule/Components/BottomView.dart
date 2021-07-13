import 'package:ecommerce_app/MVC/Model/OrderHistoryModule/OrderHistoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomView extends StatelessWidget {
  final Order order;
  BottomView({Key? key, required this.order}) : super(key: key);

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
          "${order.orderDate.toString()}",
          style: TextStyle(
            fontFamily: 'CircularStd',
            color: Color(0xffdd9522),
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
