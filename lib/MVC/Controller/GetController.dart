import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:ecommerce_app/Repository/MyRepository.dart';
import 'package:get/get.dart';

class GetController extends GetxController {
  MyRepository repository;
  GetController({required this.repository});
  var isLoading = true.obs;
  var getModelList = ProductModel().obs;

  

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
      }
    } finally {
      isLoading(false);
    }
  }
}
