import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/View/FavouriteModule/Components/favouriteTile.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final CartController _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    print("${_cartController.favouriteList}");

    return _cartController.obx(
      (state) => Scaffold(
        appBar:
            GlobalWidget.globalAppBar("Favourite", Colors.transparent, true),
        // ignore: avoid_unnecessary_containers
        body: _cartController.favouriteList.length == 0
            ? Center(child: Text("No Product are Favorite"))
            : ListView.builder(
                itemCount: _cartController.favouriteList.length,
                itemBuilder: (context, index) {
                  return FavouriteTile(
                    product: _cartController.favouriteList[index],
                  );
                },
              ),
      ),
    );
  }
}
