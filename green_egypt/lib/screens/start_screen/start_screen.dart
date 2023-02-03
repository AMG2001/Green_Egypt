import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/images_paths.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimensions.width,
        height: Dimensions.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/start_screen_images/start_screen_background_drak.png'))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: Dimensions.height * .4,
                ),
                Image(
                  image: AssetImage(ImagesPaths.applicationLogo),
                  width: Dimensions.width * .1,
                  height: Dimensions.height * .1,
                ),
                SizedBox(
                  height: Dimensions.height * .04,
                ),
                /**
                 * Row of recycling icon and Animated Text
                 */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /**
                     * Animated text "Green_Egypt"
                     */
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Green_Egypt',
                          speed: Duration(milliseconds: 500),
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height * .12,
                ),
                Text(
                  "Don't have an Account !",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 12,
                ),
                /**
                 * Regsiter button
                 */
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(
                        color: DefaultColors.defaultGreen, width: 2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(color: DefaultColors.defaultGreen),
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
                        color: DefaultColors.defaultGreen,
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
                /**
                 * Login button
                 */
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(color: DefaultColors.defaultGreen),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          DefaultColors.defaultGreen)),
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
