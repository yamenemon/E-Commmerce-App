import 'package:ecommerce_app/MVC/View/CategoryDetailsModule/Components/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  var pid;
  Body({Key? key, this.pid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(child: ProductsDetails(pId: pid))],
    );
  }
}
