import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/home_page_components/categories_list_item.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_animations_controller.dart';
import 'package:green_egypt/screens/home_page/salah_screen.dart';

class ListOfCategoriesItems extends StatelessWidget {
  const ListOfCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16, bottom: 16),
      child: GetBuilder<HomePageAnimationsController>(
          init: HomePageAnimationsController(),
          builder: (controller) {
            controller.decreaseWasteCategoriesListAnimatedContainerWidth();
            return Container(
              height: Dimensions.height * .2,
              width: Dimensions.width,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                AnimatedContainer(
                  curve: Curves.easeInOutCubic,
                  duration: Duration(seconds: 1),
                  width: controller.wasteCategoriesListAnimatedContainerWidth,
                ),
                CategoriesListItem(
                    heroTag: 'plastic',
                    itemImagePath:
                        'assets/images/main_page_images/Plastic_bag.png',
                    itemType: "Plastic",
                    itemShowPage: WasteCategoryView(
                      heroTag: 'plastic',
                      imagePath:
                          'assets/images/main_page_images/Plastic_bag.png',
                    )),
                CategoriesListItem(
                    heroTag: 'glass',
                    itemImagePath: 'assets/images/main_page_images/glass.png',
                    itemType: "Glass",
                    itemShowPage: WasteCategoryView(
                      heroTag: 'glass',
                      imagePath: 'assets/images/main_page_images/glass.png',
                    )),
                CategoriesListItem(
                    heroTag: 'paper',
                    itemImagePath:
                        'assets/images/main_page_images/paper_box.png',
                    itemType: "Paper",
                    itemShowPage: WasteCategoryView(
                      heroTag: 'paper',
                      imagePath: 'assets/images/main_page_images/paper_box.png',
                    )),
              ]),
            );
          }),
    );
    ;
  }
}
