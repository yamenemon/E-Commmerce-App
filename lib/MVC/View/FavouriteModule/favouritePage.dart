import 'package:ecommerce_app/globalWidget.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({Key? key}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalWidget.globalAppBar("Favourite", Colors.transparent, true),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Text("asdfads"),
      ),
    );
  }
}
