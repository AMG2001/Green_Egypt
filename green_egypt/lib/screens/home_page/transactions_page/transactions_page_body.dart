import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/bottom_container.dart';
import 'package:green_egypt/screens/home_page/transactions_page/components/top_container/top_container.dart';

class TransactionPageBody extends StatelessWidget {
  TransactionPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                /**
                       * upper Container that hold image if item .
                       */
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  expandedHeight: Dimensions.height * 0.42,
                  backgroundColor: themeController.isDark
                      ? Colors.grey[850]
                      : Color(0xfff7f5f5),
                  flexibleSpace: FlexibleSpaceBar(background: TopContainer()),
                ),
              ];
            },
            body: BottomContainer()),
      );
    });
  }
}
