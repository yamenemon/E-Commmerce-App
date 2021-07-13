import 'package:ecommerce_app/MVC/Controller/OrderHistoryModule/orderHistoryController.dart';
import 'package:ecommerce_app/MVC/Model/OrderHistoryModule/OrderHistoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopView extends StatelessWidget {
  final Order order;

  TopView({Key? key, required this.order}) : super(key: key);
  final OrderHistoryController _orderHistoryController =
      Get.find<OrderHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5.h,
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: "Order Cancel",
                        middleText:
                            "Are you sure, You want to cancel this order",
                        onCancel: () => Navigator.of(context),
                        textConfirm: "Confirm",
                        onConfirm: () {
                          _orderHistoryController
                              .orderCancel(order.orderId.toString());
                          Get.back();
                        });
                  },
                  child: Icon(Icons.more_vert)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Id",
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
                "#tri${order.orderId.toString()}tec",
                style: TextStyle(
                  fontFamily: 'CircularStd',
                  color: Color(0xffdd9522),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
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
              Container(
                child: Text(
                  "${order.house.toString()}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    color: Color(0xffdd9522),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
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
