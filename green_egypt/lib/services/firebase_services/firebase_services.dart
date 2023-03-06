import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:lottie/lottie.dart';

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
 * After login , add user fetched data from google auth to firestore .
 */
  static Future<DocumentReference<Map<String, dynamic>>>
      addUserFetchedData_InFireStore(
          {required String userEmail,
          required String userName,
          required String imageUrl,
          required String phoneNumber,
          required String userCredintial}) async {
    return await FirebaseFirestore.instance.collection('user_logs').add({
      'user_email': userEmail,
      'user_name': userName,
      'user_image_url': imageUrl,
      'user_phone_number': phoneNumber,
      'user_credintial': userCredintial
    });
  }

  /**
   * After adding user data into firestore , get generated id and add it with other user data .
   */
  static Future<void> addId_ToUserDataInFireStore(
      DocumentReference<Map<String, dynamic>> document) async {
    await FirebaseFirestore.instance
        .collection('user_logs')
        .doc(document.id)
        .update({'user_id': document.id});
  }

/**
 * get user data from firestore to init it in UserDataModel shared preferences .
 */
  static Future<QuerySnapshot<Map<String, dynamic>>> getUserDataFromFireStore(
      String userEmail) async {
    return await FirebaseFirestore.instance
        .collection('user_logs')
        .where('user_email', isEqualTo: userEmail)
        .get();
  }

  /**
   * Store Fethced data from fire Store into User Data Model .
   */
  static Future<void> store_userFethcedData_InUserDataModel(
      {required String userId,
      required String phoneNumber,
      required String userCredintial,
      required String userEmail,
      required String userName,
      required String userImageUrl}) async {
    await UserDataModel.initiateUserDataModel(
        id: userId,
        userPhoneNumber: phoneNumber,
        userCredintialArg: userCredintial,
        email: userEmail,
        name: userName,
        imageUrl: userImageUrl);
  }

  /**
   * Signing in with Google : 
   */

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
        String id = value.id;
        /**
                     * Store all user data locally in UserDataModel .
                     */
        await UserDataModel.initiateUserDataModel(
                id: value.id,
                name: userName,
                email: email,
                userPhoneNumber: userNumber,
                userCredintialArg: userCredintial,
                imageUrl:
                    "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")
            .then((value) async {
          /**
                     * update the same record by adding id to .
                     */
          await FirebaseFirestore.instance
              .collection('user_logs')
              .doc(id)
              .update({'user_id': id});
        });
      });
    });
  }
}
