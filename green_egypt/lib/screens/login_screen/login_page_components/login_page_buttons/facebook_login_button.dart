import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF1877F2),
        ),
      ),
      onPressed: () async {
        // await FacebookAuthController().signInWithFacebook().then((userData)async {
          /**
                 * After logging with Google Account .. get User data and store them
                 */
            // await UserLogs.settingUserInfo(
            //     userName: userData.user!.displayName!,
            //     email: userData.user!.email!,
            //     photoUrl: userData.user!.photoURL!);
            // print("Facebook user name : ${userData.user!.displayName}");
            // print("Facebook email : ${userData.user!.email}");
            // print("Facebook image url  : ${userData.user!.photoURL}");
            /**
                 * Store logging user info .
                 */
            // await UserLoggedController.loggingUser();
            // print("user Logs Saved Successfully #");
            /**
             * Navigate to home Screen - Welcome in app
             */
            // Get.offNamed(PagesNames.homePage);
        // });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .12,
            ),
            Image(
              width: MediaQuery.of(context).size.width * .08,
              height: MediaQuery.of(context).size.height * .04,
              image: AssetImage("assets/icons/facebook.png"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            Text(
              "Sign with Facebook",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
