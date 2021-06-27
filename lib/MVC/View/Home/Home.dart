// ignore: file_names
import 'package:ecommerce_app/MVC/Controller/homePageController.dart';
import 'package:ecommerce_app/Util/Constant.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalWidget.globalAppBar("Home", kWhiteColor, false),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) => Container(
            color: kPrimaryColor,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('$index'),
              ),
            )),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 5 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
