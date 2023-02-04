import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_actions.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_animations_controller.dart';

class CategoriesListItem extends StatelessWidget {
  String itemImagePath;
  String itemType;
  String heroTag;
  Widget itemShowPage;
  CategoriesListItem(
      {required this.itemImagePath,
      required this.itemType,
      required this.heroTag,
      required this.itemShowPage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageAnimationsController>(
        init: HomePageAnimationsController(),
        builder: (controller) {
          return AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: controller.itemOpacity,
            child: GestureDetector(
              onTap: () {
                Get.to(itemShowPage);
              },
            child: Container(
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  color: DefaultColors.defaultWhite,
                  borderRadius: BorderRadius.circular(18)),
              height: Dimensions.height * .2,
              width: Dimensions.width * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: heroTag,
                    child: Image(
                      width: Dimensions.width * .2,
                      image: AssetImage(itemImagePath),
                    ),
                  ),
                  Text(itemType)
                ],
              ),
            ),
            ),
          );
        });
  }
}
