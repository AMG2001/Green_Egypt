import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen.dart';
import 'package:green_egypt/screens/login_screen/login_screen.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:page_transition/page_transition.dart';

class SplachScreenCustom extends StatelessWidget {
  const SplachScreenCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // time in milli seconds
      duration: 1000,
      animationDuration: Duration(seconds: 1),
      centered: true,
      splashIconSize: Get.height,
      splash: 'assets/introduction_images/5_light.jpg',
      nextScreen:
      /**
       * If first Launch Shared preference has value true , 
       * it mean that application opened , so open on login screen 
       * else it mean that it is first time application opened , so
       * open on intro screen .
       */
          FirstLaunch.firstLaunchDone() ? LoginScreen() : IntroductionScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
