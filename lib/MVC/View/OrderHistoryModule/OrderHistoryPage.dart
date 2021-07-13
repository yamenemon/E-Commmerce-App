import 'package:ecommerce_app/MVC/Controller/OrderHistoryModule/orderHistoryController.dart';
import 'package:ecommerce_app/MVC/View/OrderHistoryModule/Components/OrderItem.dart';
import 'package:ecommerce_app/GlobalWidget/globalWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryController _orderHistoryController =
      Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: GlobalWidget.globalAppBar(
        "Order History",
        Color(0xfff2f2f2),
        true,
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
          ),
          child: _orderHistoryController.isLoading.value == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : (_orderHistoryController.getModelList.value.orders?.length ==
                          null ||
                      _orderHistoryController
                              .getModelList.value.orders?.length ==
                          0)
                  ? Center(child: Text("No History"))
                  : ListView.builder(
                      itemCount: _orderHistoryController
                              .getModelList.value.orders?.length ??
                          0,
                      itemBuilder: (ctx, i) {
                        print(_orderHistoryController
                                .getModelList.value.orders?.length ??
                            "null");
                        return OrderItem(
                          order: _orderHistoryController
                              .getModelList.value.orders![i],
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
