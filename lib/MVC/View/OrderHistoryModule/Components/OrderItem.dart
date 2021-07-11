import 'package:ecommerce_app/MVC/Model/OrderHistoryModel/OrderHistoryModel.dart';
import 'package:ecommerce_app/MVC/View/OrderHistoryModule/Components/BottomView.dart';
import 'package:ecommerce_app/MVC/View/OrderHistoryModule/Components/MiddleView.dart';
import 'package:ecommerce_app/MVC/View/OrderHistoryModule/Components/TopView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  OrderItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: new BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xffe2e2e2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          TopView(
            order: order,
          ),
          Divider(
            thickness: 1.w,
          ),
          MidlleView(
            order: order,
          ),
          Divider(
            thickness: 1.w,
          ),
          // BottomView(),
        ],
      ),
    );
  }
}
