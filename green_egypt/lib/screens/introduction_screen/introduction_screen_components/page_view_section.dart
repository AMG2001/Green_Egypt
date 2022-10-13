import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_controller.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page1.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page2.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page3.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page4.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_pages/page5.dart';


class PageViewSection extends StatelessWidget {
  List<AssetImage> images;
  PageController pageController = PageController();
  PageViewSection({required this.pageController, required this.images});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroductionScreenController>(
        init: IntroductionScreenController(),
        builder: (controller) {
          return Container(
            child: PageView(
                onPageChanged: (value) {
                  if (value > controller.index) {
                    controller.increaseIndex();
                  } else {
                    controller.decreaseIndex();
                  }
                },
                controller: pageController,
                children: [
                  Page1(image: images[0]),
                  Page2(image: images[1]),
                  Page3(image: images[2]),
                  Page4(image: images[3]),
                  Page5(image: images[4])
                ]),
          );
        });
  }
}
