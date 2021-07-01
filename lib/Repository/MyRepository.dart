import 'package:ecommerce_app/ApiProvider/ApiClient.dart';
import 'package:ecommerce_app/MVC/Controller/CommonController.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Util/AppUrl.dart';
import 'package:get/get.dart';

class MyRepository {
  final ApiClient apiClient = Get.find<ApiClient>();

  // MyRepository({required this.apiClient}) : assert(apiClient != null);

  //List type data fetch
  // Future<List<ProductModel>?> getRepo() async {
  //   var res = await apiClient.request(AppUrl.productUrl, Method.GET, null);
  //   try {
  //     if (res.data != null) {
  //       return productModelFromJson(json.encode(res.data).toString());
  //     }
  //   } catch (e) {
  //     print("getRepo ::: ${e.toString()}");
  //   }
  // }
  Future<ProductModel?> productRepo() async {
    var res = await apiClient
        .request(AppUrl.productUrl, Method.GET, null)
        .catchError(CommonController.handleError);
    try {
      if (res.data != null) {
        String responseString = res.toString();
        print(responseString);
        return productModelFromJson(responseString);
      }
    } catch (e) {
      print("productRepo ::: ${e.toString()}");
    }
  }
}
