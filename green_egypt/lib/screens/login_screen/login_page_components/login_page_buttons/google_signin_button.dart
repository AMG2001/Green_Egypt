import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:green_egypt/services/firebase_services/google_auth.dart';

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
        try {
          /**
           * First Fetch data from online Firestore
           */
          await GoogleAuth.signInWithGoogle().then((userCredential) async {
            /**
             * Second store all user data in UserDataModel with number = ""
             * Number will be changed from user account setting inside application .
             */
            /**
         * try to get user data from firestore , if there is an error :
         * it mean that user is first time login with this account , so 
         * get data , send it to firestore , add data also to UserDataModel . 
         */
            try {
              final document = await FirebaseFirestore.instance
                  .collection('user_logs')
                  .where('user_email', isEqualTo: userCredential.user!.email)
                  .get();

              /**
         * if there is no errors , it mean that this user account is registered before on firestore,
         * so get account data in map and then store it in UserDataModel .
         * then navigate to HomePage
         */
              var userData = document.docs.map((e) => e.data()).first;
              /**
           * Store fetched data in UserDataModel .
           */
              await UserDataModel.initiateUserDataModel(
                      // TODO try to solve User number problem via Facebook
                      userPhoneNumber: userData['user_phone_number'],
                      email: userData['user_email'],
                      name: userData['user_name'],
                      imageUrl: userData['user_image_url'])
                  .then((value) => Get.offNamed(PagesNames.homePage));
            } catch (e) {
              /**
               * add user in firestore but without id
               */
              await FirebaseFirestore.instance.collection('user_logs').add({
                'user_email': userCredential.user!.email,
                'user_name': userCredential.user!.displayName,
                'user_image_url': userCredential.user!.photoURL,
                'user_phone_number': ""
              }).then((document) async {
                /**
             * update user data on firestore by adding id .
             */
                await FirebaseFirestore.instance
                    .collection('user_logs')
                    .doc(document.id)
                    .update({'user_id': document.id}).then((x) async {
                  /**
                   * add user data into UserDataModel
                   */
                  await UserDataModel.initiateUserDataModel(
                      // TODO try to solve User number problem via Facebook
                      userPhoneNumber: "",
                      email: userCredential.user!.email!,
                      name: userCredential.user!.displayName!,
                      imageUrl: userCredential.user!.photoURL!);
                }).then((value) => Get.offNamed(PagesNames.homePage));
              });
            }
          });
        } on FirebaseAuthException catch (e) {
          CustomToast.showRedToast(messsage: e.code);
        }
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
