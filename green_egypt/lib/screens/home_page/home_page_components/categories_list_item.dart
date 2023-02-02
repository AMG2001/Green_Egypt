import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

class CategoriesListItem extends StatelessWidget {
  String itemImagePath;
  String itemType;
  CategoriesListItem({required this.itemImagePath, required this.itemType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: DefaultColors.defaultWhite,
          borderRadius: BorderRadius.circular(18)),
      height: Dimensions.height * .2,
      width: Dimensions.width * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(width: Dimensions.width * .2, image: AssetImage(itemImagePath)),
          Text(itemType)
        ],
      ),
    );
  }
}
