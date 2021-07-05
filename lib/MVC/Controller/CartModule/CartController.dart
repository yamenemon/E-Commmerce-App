import 'package:ecommerce_app/MVC/Model/CartModule/cartModel.dart';
import 'package:ecommerce_app/MVC/Model/DemoModel/ProductModel.dart';
import 'package:get/get.dart';

enum CART_STATUS {
  INCREMENT,
  REMOVE,
  DECREMENT,
}

class CartController extends GetxController with StateMixin {
  final carts = <Cart>[].obs;
  var favouriteList = [].obs;
  var summaryList = [].obs;
  var currentProductQty = 0.obs;
  RxDouble productDetailTotalPrice = 0.0.obs;
  RxDouble cartPageTotalPrice = 0.0.obs;
  bool isFavorited = false;
  //For cart badge
  RxInt totalProductQtyBadge = 0.obs;

  @override
  onInit() {
    super.onInit();
    // carts.add(Cart(
    //     productDemoModel: ProductDemoModel.productDemoList[0], quantity: 1));

    change(carts, status: RxStatus.success());
    updateCartListValues();
  }

  changeCart(Product product, CART_STATUS status) {
    final cartIndex = carts.indexWhere(
        (element) => element.productDemoModel.productId == product.productId);

    switch (status) {
      case CART_STATUS.INCREMENT:
        {
          if (cartIndex != -1) {
            carts[cartIndex].quantity++;
          } else {
            carts.add(Cart(productDemoModel: product, quantity: 1));
          }
        }
        break;
      case CART_STATUS.DECREMENT:
        {
          if (cartIndex != -1) {
            if (carts[cartIndex].quantity == 1)
              carts.removeAt(cartIndex);
            else if (carts[cartIndex].quantity > 1) carts[cartIndex].quantity--;
          }
        }
        break;
      case CART_STATUS.REMOVE:
        {
          if (cartIndex != -1) {
            carts.removeAt(cartIndex);
          }
        }
        break;
    }

    change(carts, status: RxStatus.success());

    updateCartListValues();

    // It is for cart list page.
    // After removing all the list. Go to empty cart page
    // if (carts.isEmpty) Get.offNamed(AppRoutes.EMPTY_CART_PAGE);
  }

  addToCart(Product product, int qty) {
    final cartIndex = carts.indexWhere(
        (element) => element.productDemoModel.productId == product.productId);

    if (cartIndex != -1) {
      carts[cartIndex].quantity += qty;
    } else {
      carts.add(Cart(productDemoModel: product, quantity: qty));
    }

    updateCartListValues();
  }

  getCurrentProductQty(Product product) {
    final cartIndex = carts.indexWhere(
        (element) => element.productDemoModel.productId == product.productId);

    if (cartIndex != -1) {
      return carts[cartIndex].quantity;
    }

    return 0;
  }

  double getCurrentProductTotalPrice(Product product) {
    final cartIndex = carts.indexWhere(
        (element) => element.productDemoModel.productId == product.productId);

    if (cartIndex != -1) {
      if (product.price != null)
        return carts[cartIndex].quantity *
            double.parse(product.price!.toString());
    }

    return 0.0;
  }

  updateProductDetailsTotalPrice(Product product) {
    if (product.price != null)
      productDetailTotalPrice.value =
          double.parse(product.price!.toString()) * currentProductQty.value;
  }

  void updateCartListValues() {
    cartPageTotalPrice.value = 0.0;
    totalProductQtyBadge.value = 0;

    carts.forEach((element) {
      if (element.productDemoModel.price != null)
        cartPageTotalPrice.value +=
            (element.productDemoModel.price! * element.quantity);

      totalProductQtyBadge.value += element.quantity;
    });
  }

  //temporary favourite
  void toggleFavorite(Product product) {
    if (isFavorited) {
      isFavorited = false;
      favouriteList.remove(product);
    } else {
      favouriteList.add(product);
      isFavorited = true;
    }
    update();
  }
}
