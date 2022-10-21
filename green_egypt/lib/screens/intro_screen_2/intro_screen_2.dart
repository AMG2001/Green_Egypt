import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/intro_screen_2/intro_screen_2_controller.dart';
import 'package:green_egypt/screens/intro_screen_2/intro_screen_2_pages/page1.dart';
import 'package:green_egypt/screens/intro_screen_2/intro_screen_2_pages/page2.dart';
import 'package:green_egypt/screens/intro_screen_2/intro_screen_2_pages/page3.dart';
import 'package:green_egypt/screens/intro_screen_2/intro_screen_2_pages/page4.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({Key? key}) : super(key: key);

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  final introScreen2Controller = Get.put(IntroScreen2Controller());
  final pageController = PageController();

  late AssetImage image1;
  late AssetImage image2;
  late AssetImage image3;
  late AssetImage image4;
  List<Widget> introPages = [];
  @override
  void initState() {
    /**
     * Pages background Images
     */
    super.initState();
    image1 = const AssetImage('assets/introduction_images/organic_basket.png');
    image2 = const AssetImage('assets/introduction_images/plastic_basket.png');
    image3 = const AssetImage('assets/introduction_images/glass_basket.png');
    image4 = const AssetImage('assets/introduction_images/paper_basket.png');
    introPages = [
      Page1(image: image1, controller: pageController),
      Page2(image: image2, controller: pageController),
      Page3(image: image3, controller: pageController),
      Page4(image: image4, controller: pageController),
    ];
  }

  @override
  /**
   * To make images preloaded while splach animation working , to increase the perfromance of the application
   */
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1, context);
    precacheImage(image2, context);
    precacheImage(image3, context);
    precacheImage(image4, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: introPages.length,
          itemBuilder: ((context, index) {
            return introPages[index];
          }),
        ),
      ),
    );
  }
}
