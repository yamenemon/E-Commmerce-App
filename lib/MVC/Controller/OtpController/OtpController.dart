import 'package:ecommerce_app/MVC/Controller/CartModule/CartController.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/SaveDataVerifyOtpModel/saveDataverifyOtpModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:ecommerce_app/Util/AppRoutes.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  MyRepository repository = MyRepository();
  String userId = "";
  String otp = "";
  String name = "";
  String phoneNumber = "";
  String address = "";
  late void Function(String) onChanged;
  late bool isValid;
  RxBool btColor = false.obs;
  final CommonController _commonController = Get.find<CommonController>();
  final CartController _cartController = Get.find<CartController>();

  void onChangedOtp(String v) async {
    v.length == 6 ? btColor.value = true : btColor.value = false;

    if (otp == v) {
      isValid = true;
      SaveDataVerifyOtpModel? _saveVerify =
          await repository.saveDataVerifyOtp(phoneNumber);
      try {
        if (_saveVerify != null && _saveVerify.profile == null) {
          print("if portion");
          _commonController.storeUserId(_saveVerify.userid.toString());
          _commonController.storeName(name.toString());
          _commonController.storeMobileNumber(phoneNumber.toString());
          _commonController.storeUserAddress(address.toString());
          _commonController.storeSession(true);

          await repository
              .saveUser(
                  _saveVerify.userid.toString(), name, phoneNumber, address)
              .then(
            (saveUser) {
              if (saveUser == true) {
                _cartController.carts.isEmpty
                    ? Get.offAllNamed(AppRoutes.HOMEPAGE)
                    : Get.offAllNamed(AppRoutes.PAYMENT_PAGE);
              }
            },
          );
        } else {
          print("else portion");
          _commonController.storeUserId(_saveVerify?.userid.toString() ?? "0");
          _commonController.storeName(_saveVerify!.profile["name"] ?? "");
          _commonController
              .storeMobileNumber(_saveVerify.profile["mobile"].toString());
          _commonController
              .storeUserAddress(_saveVerify.profile["house"] ?? "");
          _commonController.storeSession(true);
          _cartController.carts.isEmpty
              ? Get.offAllNamed(AppRoutes.HOMEPAGE)
              : Get.offAllNamed(AppRoutes.PAYMENT_PAGE);
        }
      } catch (e) {
        print("saveverify method ::: " + e.toString());
      }
    } else if (v.length == 6) {
      isValid = false;
      Get.defaultDialog(
        title: "Error",
        middleText: "Your Otp is not Matched",
        onConfirm: () {
          Get.back();
        },
      );
    }
    update();
  }
}
