import 'dart:math';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  MyRepository repository;
  GetController({required this.repository});
  var isLoading = true.obs;
  var getModelList = ProductModel().obs;
  var categoryProduct = <Product>[].obs;
  var listToShow = [];
  final _random = new Random();
  List<Product>? data = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchGetData();
  }

  fetchGetData() async {
    try {
      isLoading(true);
      var getdata = await repository.productRepo();
      if (getdata != null) {
        getModelList.value = getdata;
        data = getdata.products;
        updateDataInList();
      }
    } finally {
      isLoading(false);
    }
  }

  void updateDataInList() {
    if (data != null)
      listToShow =
          new List.generate(10, (_) => data![_random.nextInt(data!.length)]);
    print(listToShow.length);
  }

  void showAllData() {
    if (data != null) listToShow = data!;
  }

  void productStore(var pid) {
    // var productIndex =
    //     categorProduct.indexWhere((element) => element.productId == pid);

    // if (productIndex != -1) {
    //   print("category id is not in produnct list");
    // } else {
    //   categorProduct.add(Product(productId: productIndex));
    //   print("Categories length" + categorProduct.length.toString());
    // }
  }
}
