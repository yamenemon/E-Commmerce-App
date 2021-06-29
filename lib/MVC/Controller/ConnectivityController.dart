import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  Connectivity _connectivity = new Connectivity();
  RxBool _isOnline = false.obs;
  RxBool get isOnline => _isOnline;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startMonitoring();
  }

  startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((
      ConnectivityResult result,
    ) async {
      if (result == ConnectivityResult.none) {
        _isOnline.value = false;
        update();
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          _isOnline.value = isConnected;
          update();
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline.value = false;
        update();
      } else {
        _isOnline.value = true;
        update();
      }
    } on PlatformException catch (e) {
      print("PlatformException: " + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected = true;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('fakestoreapi.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
        update();
      }
    } on SocketException catch (_) {
      isConnected = false;
      update();
      //return false;
    }
    return isConnected;
  }
}
