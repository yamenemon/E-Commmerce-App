import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  MyRepository repository = MyRepository();

  void callSaveUser(
      String userId, String name, String mobile, String address) async {
    await repository.saveUser(userId.toString(), name, mobile, address).then(
      (saveUser) {
        if (saveUser == true) {
          print("Change Adress");
        }
      },
    );
  }
}
