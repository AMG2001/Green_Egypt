import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/home_page/transactions_page/widgets/bar_model.dart';

class TransactionsPageUpperContainerController extends GetxController {
  int barsViewindex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> monthsView = [
    BarModel(
      barText: 'Jan'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Feb'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Mar'.tr,
      barHeight: Dimensions.height * .1,
    ),
    BarModel(
      barText: 'Apr'.tr,
      barHeight: Dimensions.height * .09,
    ),
    BarModel(
      barText: 'May'.tr,
      barHeight: Dimensions.height * .08,
    ),
    BarModel(
      barText: 'Jun'.tr,
      barHeight: Dimensions.height * .1,
    ),
    BarModel(
      barText: 'Jul'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Aug'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Sep'.tr,
      barHeight: Dimensions.height * .15,
    )
  ];

  List<Widget> daysView = [
    BarModel(
      barText: 'Sat'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Sun'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Mon'.tr,
      barHeight: Dimensions.height * .1,
    ),
    BarModel(
      barText: 'Tus'.tr,
      barHeight: Dimensions.height * .09,
    ),
    BarModel(
      barText: 'Wen'.tr,
      barHeight: Dimensions.height * .08,
    ),
    BarModel(
      barText: 'Thu'.tr,
      barHeight: Dimensions.height * .1,
    ),
    BarModel(
      barText: 'Fri'.tr,
      barHeight: Dimensions.height * .15,
    ),
  ];

  List<Widget> weeksView = [
    BarModel(
      barText: 'Week1'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Week2'.tr,
      barHeight: Dimensions.height * .15,
    ),
    BarModel(
      barText: 'Week3'.tr,
      barHeight: Dimensions.height * .1,
    ),
    BarModel(
      barText: 'Week4'.tr,
      barHeight: Dimensions.height * .09,
    ),
  ];
  late List<List<Widget>> barsView;

  TransactionsPageUpperContainerController() {
    barsView = [daysView, weeksView, monthsView];
  }

  void show7DaysView() {
    barsViewindex = 0;
    pageController.jumpToPage(0);
    update();
  }

  void show4WeeksView() {
    barsViewindex = 1;
    pageController.jumpToPage(1);
    update();
  }

  void show12MonthView() {
    barsViewindex = 2;
    pageController.jumpToPage(2);
    update();
  }
}
