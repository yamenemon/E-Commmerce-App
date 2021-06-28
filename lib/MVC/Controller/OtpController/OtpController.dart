import 'package:get/get.dart';

class OtpController extends GetxController {
  late String currentText = "123456";
  late void Function(String) onChanged;
  late bool isValid;
  RxBool btColor = false.obs;

  void onChangedOtp(String v) {
    v.length == 6 ? btColor.value = true : btColor.value = false;

    if (currentText == v) {
      isValid = true;
    } else {
      isValid = false;
    }
    update();
  }
}
