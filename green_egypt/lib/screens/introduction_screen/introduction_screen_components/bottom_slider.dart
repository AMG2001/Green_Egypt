import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen_controller.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomSlider extends StatelessWidget {
  PageController pageController = PageController();
  BottomSlider({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<IntroductionScreenController>(
              init: IntroductionScreenController(),
              builder: (controller) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red, width: 2)),
                          ),
                        ),
                        /**
                         * Press Back Button
                         */
                        onPressed: () {
                          controller.decreaseIndex();
                          /**
                           * Move Back to previous page
                           */
                          pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.angleLeft,
                                color: Colors.red, size: 16),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "back",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      /**
                           * PageIndicator
                           */
                      SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: SlideEffect(
                            dotColor: Colors.grey,
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Colors.white),
                      ),
                      /**
                       * Next Button
                       */
                      OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(color: Colors.white, width: 2)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (controller.index == 4) {
                            await FirstLaunch.changeFirstLaunchValue()
                                .then((value) {
                              Get.offNamed(PagesNames.loginScreen);
                              print("value of first laucn changed !!");
                            });
                          } else {
                            controller.increaseIndex();
                            pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Row(
                          children: [
                            Text(
                              controller.nextButtonName,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FaIcon(FontAwesomeIcons.angleRight,
                                color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ]);
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          )
        ],
      ),
    );
  }
}
