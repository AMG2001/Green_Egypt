import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class GoogleCustomAuth {
  // static successMessage(message) {
  //   print('\n\n############################## \n\n'
  //       '$message ✔️'
  //       '\n\n############################## \n\n');
  // }

  // static errorMessage(message, e) {
  //   print('****************************************\n\n'
  //       '$message !! ❌\n\n'
  //       '$e \n\n'
  //       '****************************************\n\n');
  // }

  // static var document;
  // static var userData;
  // static Future<void> signInWithGoogle(BuildContext context) async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   successMessage('getting user credintails from google auth done ');

  //   /**
  //    * show snackbar to show state :
  //    */
  //   // Get.snackbar(
  //   //     'Login Status', 'Login Done successfuly ✔️ , moving to home page',
  //   //     colorText: Colors.black);
  //   // /**
  //   //  * show login Success Animation :
  //   //  */
  //   //  showDialog(
  //   //     context: context,
  //   //     builder: (context) {
  //   //       Future.delayed(Duration(seconds: 3), () {
  //   //         /**
  //   //                     * Remove Success Animation
  //   //                     */
  //   //         Get.back();
  //   //         /**
  //   //                      * Navigate to Home Screen
  //   //                      */
  //   //         Get.offNamed(PagesNames.homePage);
  //   //       });
  //   //       return Padding(
  //   //         padding: const EdgeInsets.all(12.0),
  //   //         child: Lottie.asset('assets/animated_vectors/login_success.json',
  //   //             repeat: false),
  //   //       );
  //   //     });

  //   // Once signed in, return the UserCredential
  //   await FirebaseAuth.instance
  //       .signInWithCredential(credential)
  //       .then((userCredential) async {
  //     successMessage('user Google Account Added to firestore Auth Service ');
  //     /**
  //            * Second store all user data in UserDataModel with number = "" and userCategory = "normal_user"
  //            * phone number will be changed from user account setting inside application .
  //            */
  //     try {
  //       /**
  //        * try to get user data from firestore , if there is an error :
  //        * it mean that user is first time login with this account , so
  //        * get data , send it to firestore , add data also to UserDataModel .
  //        */
  //       await FirebaseCustomServices.getUserDataFromFireStore(
  //               userCredential.user!.email!)
  //           .then((value) {
  //         /**
  //        * if there is no errors ✔ , it mean that this user account is registered before on firestore,
  //        * so get account data in map and then store it in UserDataModel .
  //        * then navigate to HomePage
  //        *
  //        * else , this mean this is user first time login
  //        */
  //         if (value.docs.isEmpty) {
  //           // if the value is empty , this mean this is first time user login .

  //           /**
  //              * Getting data from Google Auth [name , image , email , phoneNumber]
  //              * add user in firestore but without id
  //              */
  //           FirebaseCustomServices.addUserFetchedData_InFireStore(
  //                   userName: userCredential.user!.displayName!,
  //                   userEmail: userCredential.user!.email!,
  //                   imageUrl: userCredential.user!.photoURL!,
  //                   phoneNumber: userCredential.user!.phoneNumber!,
  //                   userCredintial: "normal_user")
  //               .then((document) async {
  //             /**
  //                  * add user data into UserDataModel
  //                  */
  //             await FirebaseCustomServices
  //                 .store_userFethcedData_InUserDataModel(
  //                     userId: document.id,
  //                     phoneNumber: userCredential.user!.phoneNumber!,
  //                     userCredintial: "normal_user",
  //                     userEmail: userCredential.user!.email!,
  //                     userName: userCredential.user!.displayName!,
  //                     userImageUrl: userCredential.user!.photoURL!);
  //             /**
  //            * update user data on firestore by adding id .
  //            */
  //             await FirebaseCustomServices.addId_ToUserDataInFireStore(document)
  //                 .then((value) {
  //               Get.snackbar('Login Status',
  //                   'Login Done successfuly ✔️ , moving to home page');
  //               Get.offAllNamed(PagesNames.homePage);
  //               /**
  //          * Show success animation
  //          */
  //             });
  //           });
  //         } else {
  //           try {
  //             userData = value.docs.map((e) => e.data()).first;
  //             successMessage(
  //                 'getting first user data from fetched map done successfully');
  //             /**
  //          * Store fetched data in UserDataModel .
  //          */
  //             try {
  //               FirebaseCustomServices.store_userFethcedData_InUserDataModel(
  //                       userId: userData['user_id'],
  //                       phoneNumber: userData['user_phone_number'],
  //                       userCredintial: userData['user_credintial'],
  //                       userEmail: userData['user_email'],
  //                       userName: userData['user_name'],
  //                       userImageUrl: userData['user_image_url'])
  //                   .then((value) {
  //                 ConsoleMessage.successMessage(
  //                     'all user data stored in SharedPref');
  //                 Get.offAllNamed(PagesNames.homePage);
  //               });
  //             } catch (e) {
  //               ConsoleMessage.errorMessage(
  //                   'Error while adding user data in shared pref',
  //                   e.toString());
  //             }
  //           } catch (e) {
  //             /**
  //              * Getting data from Google Auth [name , image , email , phoneNumber]
  //              * add user in firestore but without id
  //              */
  //             FirebaseCustomServices.addUserFetchedData_InFireStore(
  //                     userName: userCredential.user!.displayName!,
  //                     userEmail: userCredential.user!.email!,
  //                     imageUrl: userCredential.user!.photoURL!,
  //                     phoneNumber: userCredential.user!.phoneNumber!,
  //                     userCredintial: "normal_user")
  //                 .then((document) async {
  //               /**
  //                  * add user data into UserDataModel
  //                  */
  //               await FirebaseCustomServices
  //                   .store_userFethcedData_InUserDataModel(
  //                       userId: document.id,
  //                       phoneNumber: userCredential.user!.phoneNumber!,
  //                       userCredintial: "normal_user",
  //                       userEmail: userCredential.user!.email!,
  //                       userName: userCredential.user!.displayName!,
  //                       userImageUrl: userCredential.user!.photoURL!);
  //               /**
  //            * update user data on firestore by adding id .
  //            */
  //               await FirebaseCustomServices.addId_ToUserDataInFireStore(
  //                       document)
  //                   .then((value) {
  //                 Get.snackbar('Login Status',
  //                     'Login Done successfuly ✔️ , moving to home page');
  //                 Get.offAllNamed(PagesNames.homePage);
  //                 /**
  //          * Show success animation
  //          */
  //               });
  //             });
  //           }
  //         }
  //       });
  //     } catch (e) {
  //       errorMessage(
  //           'Error while getting First user data from Fetched data map',
  //           e.toString());
  //     }
  //   });
  // }

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
           * Store fetched data in UserDataModel .
           */
        await UserDataModel.initiateUserDataModel(
                id: userData['user_id'],
                userCredintialArg: userData['user_credintial'],
                userPhoneNumber: userData['user_phone_number'],
                email: userData['user_email'],
                name: userData['user_name'],
                imageUrl: userData['user_image_url'])
            .then((value) {
          Get.offAllNamed(PagesNames.homePage);
        });
      } catch (e) {
        print(e);
        Get.snackbar(
            'Login Status', 'Login Done successfuly ✔️ , moving to home page',
            colorText: Colors.black);
        /**
               * Getting data from Google Auth [name , image , email , phoneNumber]
               * add user in firestore but without id
               */
        await FirebaseFirestore.instance.collection('user_logs').add({
          'user_email': userCredential.user!.email,
          'user_name': userCredential.user!.displayName,
          'user_image_url': userCredential.user!.photoURL,
          'user_phone_number': "",
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
            await UserDataModel.initiateUserDataModel(
                id: user_id,
                userPhoneNumber: "",
                userCredintialArg: "normal_user",
                email: userCredential.user!.email!,
                name: userCredential.user!.displayName!,
                imageUrl: userCredential.user!.photoURL!);
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
