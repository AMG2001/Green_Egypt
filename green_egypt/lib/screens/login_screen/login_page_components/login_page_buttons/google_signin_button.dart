import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSignInButton extends StatelessWidget {
  /**
   * Google Sign in button is running with these Steps :
   * 1- Try logging with Google Account 
   * if accepted .. store user data in UserInfo and store logged in UserLoggedController
   * else .. show error in Toast
   */
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Google SIgn in Button
     */
    return ElevatedButton(
      /**
       * Button Styling
       */
      style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      /**
           * on pressed
           */
      onPressed: () async {
        // try {
        //   /**
        //    * Trying to access with Google Account
        //    */
        //   await GoogleAuthController()
        //       .signInWithGoogle()
        //       .then((userData) async {
        //     /**
        //          * After logging with Google Account .. get User data and store them
        //          */
        //     await UserLogs.settingUserInfo(
        //         userName: userData.user!.displayName!,
        //         email: userData.user!.email!,
        //         photoUrl: userData.user!.photoURL!);
        //     print("google user name : ${userData.user!.displayName}");
        //     print("Google email : ${userData.user!.email}");
        //     print("Google image url  : ${userData.user!.photoURL}");
        //     /**
        //          * Store logging user info .
        //          */
        //     await UserLoggedController.loggingUser();
        //     print("user Logs Saved Successfully #");
        //     /**
        //      * Navigate to home Screen - Welcome in app
        //      */
        //     Get.offNamed(PagesNames.homePageScreenName);
        //   });
        // } catch (e) {
        //   /**
        //    * if there is any error - Show Toast with error message
        //    */
        //   Fluttertoast.showToast(
        //       msg: e.toString(),
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        // }
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
              image: AssetImage("assets/icons/google.png"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .05,
            ),
            Text(
              "Sign with Google",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
