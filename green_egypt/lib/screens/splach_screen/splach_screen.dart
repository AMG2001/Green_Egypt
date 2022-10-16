import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/images_paths.dart';
import 'package:green_egypt/screens/introduction_screen/introduction_screen.dart';
import 'package:green_egypt/screens/start_screen/start_screen.dart';
import 'package:green_egypt/services/Shared_preferences/first_launch.dart';
import 'package:page_transition/page_transition.dart';

class SplachScreenCustom extends StatelessWidget {
  const SplachScreenCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // time in milli seconds
      duration: 2500,
      animationDuration: Duration(seconds: 1),
      centered: true,
      splashIconSize: Get.height,

      splash: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesPaths.splashImagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.55), BlendMode.darken),
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.recycling_sharp,
                color: Colors.green,
                size: 60,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "🍀 Green Egypt 🍀",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Saving Nature is our Duty 💚",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ]),
      ),

      nextScreen:
          /**
       * If first Launch Shared preference has value true , 
       * it mean that application opened , so open on login screen 
       * else it mean that it is first time application opened , so
       * open on intro screen .
       */
          FirstLaunch.firstLaunchDone() ? StartScreen() : IntroductionScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
