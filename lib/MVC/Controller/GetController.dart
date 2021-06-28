import 'dart:math';

import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/MVC/Model/GetModelDemo.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  MyRepository repository;
  GetController({required this.repository});
  var isLoading = true.obs;
  // var getModelList = ProductModel().obs;
  // RxList<ProductModel>? getModelList;
  // // RxList<ProductModel>? getList;
  // List<ProductModel>? getList;
  List<ProductModel>? getList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchGetData();
  }

  Future<List<ProductModel>?> fetchGetData() async {
    try {
      isLoading(true);
      var getdata = await repository.getRepo();
      if (getdata != null) {
        print(getdata.length.toString());
        getList = getdata;
      }

      // if (getList != null) {
      //   getList!.forEach((element) {
      //     print(element);
      //   });
      //   // print("getController ::: " + getList.toString());
      //   return getList;
      // }
    } finally {
      isLoading(false);
    }
    update();
  }
}
