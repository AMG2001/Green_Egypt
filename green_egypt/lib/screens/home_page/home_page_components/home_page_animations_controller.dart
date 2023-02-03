import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageAnimationsController extends GetxController {
  double animatedContainerHeight = 100;
  double itemOpacity = 0.0;
  double wasteCategoriesListAnimatedContainerWidth = 150;

  void decreaseWasteCategoriesListAnimatedContainerWidth() {
    Timer(
      Duration(milliseconds: 1000),
      () {
        wasteCategoriesListAnimatedContainerWidth = 0.0;
        update();
      },
    );
  }

  void decreaseAnimaredContainerSize() {
    Timer(Duration(milliseconds: 1000), () {
      animatedContainerHeight = 0;
      update();
    });
  }

  void removeHidden() {
    Timer(
      Duration(milliseconds: 1000),
      () {
        itemOpacity = 1.0;
        update();
      },
    );
  }
}
