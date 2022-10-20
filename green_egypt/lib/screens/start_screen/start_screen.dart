import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/images_paths.dart';
import 'package:green_egypt/config/pages_names.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            /**
             * Adding dark layer on the image
             */
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
                /**
                 * start page background Image 
                 */
            image: AssetImage(ImagesPaths.startPageImagePath),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /**
                 * Row of recycling icon and Animated Text
                 */
                Row(
                  children: [
                    Hero(
                      tag: Constants.recyclingIconTag,
                      child: Icon(
                        Icons.recycling_outlined,
                        color: Colors.green,
                        size: 56,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Green_Egypt 🍀',
                          speed: Duration(milliseconds: 500),
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Don't have an Account !",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 12,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.green, width: 2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  onPressed: () {
                    /**
                     * Navigate to Register Page
                     */
                    Get.toNamed(PagesNames.registerPage);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.person_add_alt_outlined,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Already have an Account !",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    Get.toNamed(PagesNames.loginScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.done_all_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .04,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
