import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
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

    return _cartController.obx((state) => Scaffold(
        appBar:
            GlobalWidget.globalAppBar("Favourite", Colors.transparent, true),
        // ignore: avoid_unnecessary_containers
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (item, context) {
              return // Figma Flutter Generator Group14Widget - GROUP
                  Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: Get.height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        tileColor: Colors.transparent,
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80.w,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )),
              );
            })));
  }
}
