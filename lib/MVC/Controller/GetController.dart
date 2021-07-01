import 'dart:math';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  MyRepository repository;
  GetController({required this.repository});
  var isLoading = true.obs;
  var getModelList = ProductModel().obs;

  //After Filter Category Details Are stored here
  List<Product>? catDetailsProduct;

  //For Randomized in HomePage Popular
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

  //Popular Products are Randomaized here
  void updateDataInList() {
    if (data != null)
      listToShow =
          new List.generate(10, (_) => data![_random.nextInt(data!.length)]);
    print(listToShow.length);
  }

  //After randomized product are stored here for HomePage Popular Product
  void showAllData() {
    if (data != null) listToShow = data!;
  }

  //Category Details Product are filter here from ProductList
  void productStore(List<Product> product, var prid) {
    catDetailsProduct = product.where((c) => c.categoryId == prid).toList();
    print(catDetailsProduct);
  }
}
