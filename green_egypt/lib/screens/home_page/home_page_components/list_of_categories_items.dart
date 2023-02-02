import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/home_page_components/categories_list_item.dart';

class ListOfCategoriesItems extends StatelessWidget {
  const ListOfCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16, bottom: 16),
      child: Container(
        height: Dimensions.height * .2,
        width: Dimensions.width,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          CategoriesListItem(
              itemImagePath: 'assets/images/Plastic_bag.png',
              itemType: "Plastic"),
          CategoriesListItem(
              itemImagePath: 'assets/images/glass.png', itemType: "Glass"),
          CategoriesListItem(
              itemImagePath: 'assets/images/paper_box.png', itemType: "Paper"),
        ]),
      ),
    );
    ;
  }
}
