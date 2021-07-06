import 'package:ecommerce_app/MVC/Model/OrderHistoryModel/OrderHistoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopView extends StatelessWidget {
  final Order order;

  TopView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 13.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID : ${order.orderId.toString()}",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff3f1f20),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.6.sp,
                ),
              ),
              Text(
                "Order Date : ${order.orderDate.toString()}",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xffdd9522),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff3f1f20),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.6.sp,
                ),
              ),
              Text(
                "${order.name.toString()}",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xffdd9522),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Address ",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff3f1f20),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.6.sp,
                ),
              ),
              Text(
                "${order.house.toString()}",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xffdd9522),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payable Price",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xff3f1f20),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.6.sp,
                ),
              ),
              Text(
                "\$${order.payablePrice.toString()}",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xffdd9522),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
