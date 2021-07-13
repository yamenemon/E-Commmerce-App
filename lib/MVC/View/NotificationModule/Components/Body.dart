import 'package:ecommerce_app/MVC/Controller/FirebaseModule/FirebaseController.dart';
import 'package:ecommerce_app/MVC/View/NotificationModule/Components/notification_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);
  final FireBaseController _firebaseController = Get.find<FireBaseController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: _firebaseController.notificationlist.length == 0
            ? Center(child: Text("No Notification"))
            : ListView.builder(
                itemCount: _firebaseController.notificationlist.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(
                        _firebaseController.notificationlist[index].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _firebaseController.notificationlist.removeAt(index);
                      _firebaseController.update();
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset("images/Trash.svg"),
                        ],
                      ),
                    ),
                    child: NotificationTile(
                        notificationModel:
                            _firebaseController.notificationlist[index]),
                  );
                },
              ),
      ),
    );
  }
}
