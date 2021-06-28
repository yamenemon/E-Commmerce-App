import 'package:ecommerce_app/MVC/Model/CartModule/cartModel.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88.w,
          child: AspectRatio(
            aspectRatio: 0.88.sp,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Image.network(cart.productDemoModel.image.toString()),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.5,
              child: Text(
                cart.productDemoModel.title.toString(),
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.productDemoModel.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: "x${cart.quantity}",
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
