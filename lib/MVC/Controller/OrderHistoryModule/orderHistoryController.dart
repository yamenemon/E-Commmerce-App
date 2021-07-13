import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/OrderHistoryModule/OrderHistoryModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  MyRepository repository = MyRepository();

  var isLoading = true.obs;
  var getModelList = OrderHistoryModel().obs;
  final CommonController _commonController = Get.find<CommonController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrderData();
  }

  fetchOrderData() async {
    try {
      isLoading(true);
      var getdata =
          await repository.orderHistory(_commonController.getUserId());
      if (getdata != null) {
        getModelList(getdata);
      }
    } finally {
      isLoading(false);
    }
  }

  orderCancel(String orderId) async {
    Map<String, dynamic> body = {
      "userid": _commonController.getUserId(),
      "orderid": orderId
    };
    await repository.cancelOrderRepo(body).then(
      (cancelStatus) {
        if (cancelStatus == true) {
          fetchOrderData();
          Get.defaultDialog(
              title: "Order Cancel",
              middleText: "Your Order is Cancel Sucessfully",
              onConfirm: () {
                Get.back();
              });
        } else {
          Get.defaultDialog(
              title: "Error",
              middleText: "Something went wrong,Please Try again later",
              onConfirm: () {
                Get.back();
              });
        }
      },
    );
  }
}
