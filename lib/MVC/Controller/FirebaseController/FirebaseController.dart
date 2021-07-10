import 'package:ecommerce_app/Util/LocalNotification/LocalNotificationService.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

///Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

class FireBaseController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    FirebaseMessaging.instance.getInitialMessage();
    LocalNotificationService.initialize();
    foregroudMethod();
  }

  ///gives you the message on which user taps
  ///and it opened the app from terminated state
  void backgroundBtCloseMethod() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["Screen"];
        Get.offAndToNamed(routeFromMessage);
      }
    });
  }

  ///forground work
  void foregroudMethod() {
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationService.display(message);
    });
  }

  ///When the app is in background but opened
  void backgroundBtOpenedMethod() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data["Screen"] != null) {
        final routeFromMessage = message.data["Screen"];
        Get.offAndToNamed(routeFromMessage);
      }
    });
  }
}
