// ignore: file_names
import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/View/Cart/Components/body.dart';
import 'package:ecommerce_app/MVC/View/Cart/Components/checkout_cart.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return _cartController.obx((state) => Scaffold(
          appBar: GlobalWidget.globalAppBar(
              "${_cartController.carts.length.toString()} products added",
              Colors.transparent,
              true),
          body: Body(),
          bottomNavigationBar: CheckoutCard(),
        ));
  }
}
