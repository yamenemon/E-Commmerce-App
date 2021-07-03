import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/MVC/View/CategoryDetailsModule/Components/Body.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsPage extends StatefulWidget {
  CategoryDetailsPage({Key? key}) : super(key: key);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidget.globalAppBar(
            "Category Details", Colors.transparent, true),
        body: Center(child: Body()),
      ),
    );
  }
}
