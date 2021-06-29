import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';

class Cart {
  Product productDemoModel;
  int quantity = 0;

  Cart({required this.productDemoModel, required this.quantity});
}
