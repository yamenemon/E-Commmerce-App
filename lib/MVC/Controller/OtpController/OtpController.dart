import 'package:ecommerce_app/MVC/Model/SaveDataVerifyOtpModel/saveDataverifyOtpModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  MyRepository repository = MyRepository();
  String userId = "5";
  String otp = "";
  String name = "";
  String phoneNumber = "";
  String address = "";
  late void Function(String) onChanged;
  late bool isValid;
  RxBool btColor = false.obs;

  void onChangedOtp(String v) async {
    v.length == 6 ? btColor.value = true : btColor.value = false;

    if (otp == v) {
      isValid = true;
      SaveDataVerifyOtpModel? _saveVerify =
          await repository.saveDataVerifyOtp(phoneNumber);
      try {
        if (_saveVerify != null && _saveVerify.profile == null) {
          print("if portion");
          await repository
              .saveUser(
                  _saveVerify.userid.toString(), name, phoneNumber, address)
              .then(
            (saveUser) {
              if (saveUser == true) {
                Get.offAndToNamed(AppRoutes.PAYMENT_PAGE);
              }
            },
          );
        } else {
          print("else portion");
          Get.offAndToNamed(AppRoutes.PAYMENT_PAGE,
              arguments: [_saveVerify!.profile, _saveVerify.userid]);
        }
      } catch (e) {
        print("saveverify method ::: " + e.toString());
      }
    } else {
      isValid = false;
    }
    update();
  }
}
