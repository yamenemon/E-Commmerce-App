// ignore: file_names
import 'package:ecommerce_app/MVC/Controller/ConnectivityController.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/body.dart';
import 'package:ecommerce_app/MVC/View/HomeModule/Components/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/Util/Enums.dart';
import 'package:ecommerce_app/Util/NoInternet/NoInternet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // ignore: unrelated_type_equality_checks
        body: _connectivityController.isOnline == true ? Body() : NoInternet(),
        bottomNavigationBar:
            const CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
