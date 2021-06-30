import 'package:ecommerce_app/MVC/View/CategoryDetailsModule/Components/Body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsPage extends StatefulWidget {
  CategoryDetailsPage({Key? key}) : super(key: key);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  var _pId = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Category Details"),
        ),
        body: Body(pid: _pId),
      ),
    );
  }
}
