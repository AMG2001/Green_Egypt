import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class GoogleCustomAuth {
  FirebaseCustomServices fcs = FirebaseCustomServices();
  static Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    /**
     * show snackbar to show state :
     */
    Get.snackbar(
        'Login Status', 'Login Done successfuly ✔️ , moving to home page',
        colorText: Colors.black);
    /**
     * show login Success Animation :
     */
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            /**
                        * Remove Success Animation
                        */
            Get.back();
            /**
                         * Navigate to Home Screen 
                         */
            Get.offNamed(PagesNames.homePage);
          });
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Lottie.asset('assets/animated_vectors/login_success.json',
                repeat: false),
          );
        });

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((userCredential) async {
      /**
             * Second store all user data in UserDataModel with number = "" and userCategory = "normal_user"
             * phone number will be changed from user account setting inside application .
             */

      /**
         * try to get user data from firestore , if there is an error :
         * it mean that user is first time login with this account , so 
         * get data , send it to firestore , add data also to UserDataModel . 
         */
      try {
        final document = await FirebaseCustomServices.getUserDataFromFireStore(
            userCredential.user!.email!);
        /**
         * if there is no errors ✔ , it mean that this user account is registered before on firestore,
         * so get account data in map and then store it in UserDataModel .
         * then navigate to HomePage
         */
        var userData = document.docs.map((e) => e.data()).first;
        /**
           * Store fetched data in UserDataModel .
           */
        await FirebaseCustomServices.store_userFethcedData_InUserDataModel(
                userId: userData['user_id'],
                phoneNumber: userData['user_phone_number'],
                userCredintial: userData['user_credintial'],
                userEmail: userData['user_email'],
                userName: userData['user_name'],
                userImageUrl: userData['user_image_url'])
            .then((value) {
          Get.offAllNamed(PagesNames.homePage);
        });
      } catch (e) {
        /**
         * if there si some error happende , then this mean user first time login , so we need to get his data .
         */
        print(e);
        Get.snackbar(
            'Login Status', 'Login Done successfuly ✔️ , moving to home page',
            colorText: Colors.black);
        /**
               * Getting data from Google Auth [name , image , email , phoneNumber]
               * add user in firestore but without id
               */
        await FirebaseCustomServices.addUserFetchedData_InFireStore(
                userName: userCredential.user!.displayName!,
                userEmail: userCredential.user!.email!,
                imageUrl: userCredential.user!.photoURL!,
                phoneNumber: userCredential.user!.phoneNumber!,
                userCredintial: "normal_user")
            .then((document) async {
          /**
                   * add user data into UserDataModel
                   */
          await FirebaseCustomServices.store_userFethcedData_InUserDataModel(
              userId: document.id,
              phoneNumber: userCredential.user!.phoneNumber!,
              userCredintial: "normal_user",
              userEmail: userCredential.user!.email!,
              userName: userCredential.user!.displayName!,
              userImageUrl: userCredential.user!.photoURL!);
          /**
             * update user data on firestore by adding id .
             */
          await FirebaseCustomServices.addId_ToUserDataInFireStore(document)
              .then((value) {
            Get.snackbar('Login Status',
                'Login Done successfuly ✔️ , moving to home page');
            Get.offAllNamed(PagesNames.homePage);
            /**
           * Show success animation
           */
          });
        });
      }
    });
  }
}
