import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class GoogleCustomAuth {
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
        final document = await FirebaseFirestore.instance
            .collection('user_logs')
            .where('user_email', isEqualTo: userCredential.user!.email)
            .get();

        /**
         * if there is no errors ✔ , it mean that this user account is registered before on firestore,
         * so get account data in map and then store it in UserDataModel .
         * then navigate to HomePage
         */
        var userData = document.docs.map((e) => e.data()).first;
        /**
           * Store fetched data in user data box .
           */
        UserDataBox.instance.put_allUserData(
            id: userData['user_id'],
            name: userData['user_name'],
            email: userData['user_email'],
            imageUrl: userData['user_image_url'],
            phoneNumber: userData['user_phone_number'],
            credintial: userData['user_credintial'],
            earned: userData['user_earned_cash'],
            savedCo2:userData['user_saved_co2'] ,
            recycledItems: userData['user_recycled_items'],
            loggedIn:true ,
            reviewedBefore: userData['user_review_before']
            );
        Get.offAllNamed(PagesNames.homePage);
      } catch (e) {
        // if the code enter Here , this mean it's first time
        // user logged in with google account , so register him
        // in our firestore .
        print(e);
        Get.snackbar(
            'Login Status', 'Login Done successfuly ✔️ , moving to home page',
            colorText: Colors.black);
              /**
               * Getting data from Google Auth [name , image , email , phoneNumber]
               * add user in firestore but without id
               */
        await FirebaseFirestore.instance.collection('user_logs').add({
          'user_name': userCredential.user!.displayName,
          'user_email': userCredential.user!.email,
          'user_image_url': userCredential.user!.photoURL,
          'user_phone_number': "",
          'user_earned_cash':0,
          'user_saved_co2':0,
          'user_recycled_items':0,
          'user_review_before':false,
          'user_credintial': "normal_user"
        }).then((document) async {
          var user_id = document.id;
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

            UserDataBox.instance.put_allUserData(
                id: user_id,
                name: userCredential.user!.displayName!,
                email: userCredential.user!.email!,
                imageUrl: userCredential.user!.photoURL!,
                phoneNumber: "",
                credintial: 'normal_user',
                earned: 0,
                recycledItems: 0,
                savedCo2: 0,
                loggedIn: true,
                reviewedBefore: false
                );
            Get.offAllNamed(PagesNames.homePage);
          }).then((value) {
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
