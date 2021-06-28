import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cart_cart.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
        itemCount: _cartController.carts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Dismissible(
            key: Key(
                _cartController.carts[index].productDemoModel.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                _cartController.carts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("images/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: _cartController.carts[index]),
          ),
        ),
      ),
    );
  }
}
