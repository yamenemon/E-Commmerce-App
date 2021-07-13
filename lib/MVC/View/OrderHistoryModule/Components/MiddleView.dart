import 'package:ecommerce_app/MVC/Model/OrderHistoryModule/OrderHistoryModel.dart';
import 'package:ecommerce_app/MVC/View/OrderHistoryModule/Components/ProductItem.dart';
import 'package:flutter/material.dart';

class MidlleView extends StatelessWidget {
  final Order order;

  MidlleView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: order.productList!.length,
      itemBuilder: (ctx, i) {
        return ProductItem(productList: order.productList![i]);
      },
    );
  }
}
