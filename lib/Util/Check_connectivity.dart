import 'package:connectivity/connectivity.dart';


  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      return true;
      }
      else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
      // I am connected to a WIFI network, make sure there is actually a net connection.
     
    } else {
      // Neither mobile data or WIFI detected, not internet connection found.
      return false;
    }
    }
    
  