import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';

class FirebaseCustomServices {
  /**
   * FirebaseCustomServices class : 
   * ************** is used to handle and contain all firebase work as : ************************
   * 1. sign in with email and password .
   * 2. sign in with google .
   * 3. sign in with facebook .
   * 4. register new user .
   */

  /**
   * Methods are arranged in this class as the Following : 
   * 1. Google sign in .
   * 2. email and password sign in .
   * 3. Facebook signing in .
   */
  /**
   * Signing in with Google : 
   */
  static Future<void> signInWithGoogle() async {
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
                userCredintialArg: userData['user_credintial'],
                userPhoneNumber: userData['user_phone_number'],
                email: userData['user_email'],
                name: userData['user_name'],
                imageUrl: userData['user_image_url'])
            .then((value) => Get.offNamed(PagesNames.homePage));
      } catch (e) {
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
                userPhoneNumber: "",
                userCredintialArg: "normal_user",
                email: userCredential.user!.email!,
                name: userCredential.user!.displayName!,
                imageUrl: userCredential.user!.photoURL!);
          }).then((value) => Get.offNamed(PagesNames.homePage));
        });
      }
    });
  }

  /**
   * Sign in with email and password : 
   */
  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print("no user found for this email");
        } else if (e.code == 'Wrong-password') {
          print('Wrong password provided');
        }
        return user;
      }
    } catch (e) {
      CustomToast.showRedToast(
          messsage:
              "error when sign in with email and password : \n ${e.toString()}");
    }
  }

  /**
   * Signing in with Facebook : 
   */

  static Future<void> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      FacebookAuth.instance.getUserData().then((value) async {
        /**
         * try to get user data from firestore , if there is an error :
         * it mean that user is first time login with this account , so 
         * get data , send it to firestore , add data also to UserDataModel . 
         */
        try {
          final document = await FirebaseFirestore.instance
              .collection('user_logs')
              .where('user_email', isEqualTo: value['email'])
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
                  userCredintialArg: userData['user_credintial'],
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
            'user_email': value['email'],
            'user_name': value['name'],
            'user_credintial': 'normal_user',
            'user_image_url': value['picture']['data']['url'],
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
                  userCredintialArg: "normal_user",
                  userPhoneNumber: "",
                  email: value['email'],
                  name: value['name'],
                  imageUrl: value['picture']['data']['url']);
            }).then((value) => Get.offAllNamed(PagesNames.homePage));
          });
        }
        // you are logged
        final AccessToken accessToken = result.accessToken!;
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  /**
           * Register user in firebase Auth
           */
  static Future<void> registerNewUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userNumber,
    required String userCredintial,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      String userName = "${firstName} ${lastName}";
      /**
                     * Store all user data locally in UserDataModel .
                     */
      await UserDataModel.initiateUserDataModel(
              name: userName,
              email: email,
              userPhoneNumber: userNumber,
              userCredintialArg: userCredintial,
              imageUrl:
                  "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")
          .then((value) async {
        /**
                       * Store user data in fireStore , but without id : 
                       */
        await FirebaseFirestore.instance.collection('user_logs').add({
          'user_name': userName,
          'user_first_name': firstName,
          'user_last_name': lastName,
          'user_email': email,
          'user_image_url':
              "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
          'user_phone_number': userNumber,
          'user_credintial': userCredintial
        }).then((value) async {
          /**
                     * update the same record by adding id to .
                     */
          await FirebaseFirestore.instance
              .collection('user_logs')
              .doc(value.id)
              .update({'user_id': value.id});
        });
      });
    });
  }
}
