import 'package:ecommerce_app/MVC/View/NotificationModule/Components/Body.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          GlobalWidget.globalAppBar("Notification", Colors.transparent, true),
      body: Center(child: Body()),
    );
  }
}
