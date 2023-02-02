import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_animations_controller.dart';

class UserDetailColumn extends StatelessWidget {
  // final animationController = Get.put(HomePageAnimationsController());
  Widget icon;
  String detailValue;
  String detailTitle;
  int animationMilliSeconds;
  UserDetailColumn(
      {required this.icon,
      required this.detailValue,
      required this.detailTitle,
      required this.animationMilliSeconds});

  @override
  Widget build(BuildContext context) {
    // animationController.decreaseAnimaredContainerSize();
    return GetBuilder<HomePageAnimationsController>(
        init: HomePageAnimationsController(),
        builder: (controller) {
          controller.decreaseAnimaredContainerSize();
          controller.removeHidden();
          return Expanded(
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: controller.itemOpacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedContainer(
                      curve: Curves.easeInOutCubic,
                      duration: Duration(seconds: 1),
                      height: controller.animatedContainerHeight),
                  icon,
                  Text(
                    detailValue,
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.yellow[50]!.withOpacity(.9),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    detailTitle,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          );
        });
  }
}
