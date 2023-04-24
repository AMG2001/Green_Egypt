import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/bottom_container.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/top_container.dart';

class TransactionPageBody extends StatelessWidget {
  TransactionPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Container(
        width: Dimensions.width,
        height: Dimensions.height,
        child: Column(
          children: [TopContainer(), BottomContainer()],
        ),
      );
    });
  }
}
