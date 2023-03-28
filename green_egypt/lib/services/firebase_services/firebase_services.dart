import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:green_egypt/services/custom_toast.dart';
import '../boxes/user_data_db.dart';

class FirebaseCustomServices {
  /**
   * Make class as Singleton .
   */
  FirebaseCustomServices._privateConstructor();

  static final FirebaseCustomServices _instance =
      FirebaseCustomServices._privateConstructor();

  static FirebaseCustomServices get instance => _instance;

  String _key_collection_user_logs = 'user_logs';
  String _key_userId = "user_id";
  String _key_userName = "user_name";
  String _key_userEmail = "user_email";
  String _key_userImageUrl = "userImageUrl";
  String _key_userPhoneNumber = "phone_number";
  String _key_userEarnedCash = "earned_cash";
  String _key_userSavedCo2 = "saved_co2";
  String _key_userRecycledItems = "recycled_items";
  String _key_userReviewBefore = "review_before";
  String _key_userCredintial = "user_credintial";

  /**
   * After login with google , if this is first time user logged in
   * then get user data and upload it to firestore .
   */
  Future<void> googleLogin_uploadUserDataToFirestore_thenStoreDataLocally(
      {required UserCredential userCredential,
      String userName = "",
      String userEmail = "",
      String userImageUrl = "",
      String phoneNumber = "",
      int earnedCash = 0,
      int savedCo2 = 0,
      int recycledItems = 0,
      bool reviewBefore = false,
      String credintial = "normal_user"}) async {
    var user_id;
    try {
      await FirebaseFirestore.instance.collection('user_logs').add({
        _key_userName: userCredential.user!.displayName,
        _key_userEmail: userCredential.user!.email,
        _key_userImageUrl: userCredential.user!.photoURL,
        _key_userPhoneNumber: "",
        _key_userEarnedCash: 0,
        _key_userSavedCo2: 0,
        _key_userRecycledItems: 0,
        _key_userReviewBefore: false,
        _key_userCredintial: "normal_user"
      }).then((document) async {
        user_id = document.id;
        /**
             * update user data on firestore by adding id .
             */
        await FirebaseFirestore.instance
            .collection(_key_collection_user_logs)
            .doc(document.id)
            .update({_key_userId: document.id});
      });
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
          reviewedBefore: false);
    } catch (e) {
      CustomToast.showRedToast(messsage: "error : ${e.toString()}");
    }
  }

  /**
   * this method is used
   */
  Future<void> uploadUserDataToFirestore_thenStoreDataLocally(
      {required UserCredential userCredential,
      String userName = "",
      String userEmail = "",
      String userImageUrl = "",
      String phoneNumber = "",
      int earnedCash = 0,
      int savedCo2 = 0,
      int recycledItems = 0,
      bool reviewBefore = false,
      String credintial = "normal_user"}) async {
    var user_id;
    try {
      await FirebaseFirestore.instance.collection('user_logs').add({
        _key_userName: userName,
        _key_userEmail: userEmail,
        _key_userImageUrl: userImageUrl,
        _key_userPhoneNumber: phoneNumber,
        _key_userEarnedCash: earnedCash,
        _key_userSavedCo2: savedCo2,
        _key_userRecycledItems: recycledItems,
        _key_userReviewBefore: reviewBefore,
        _key_userCredintial: credintial
      }).then((document) async {
        user_id = document.id;
        /**
             * update user data on firestore by adding id .
             */
        await FirebaseFirestore.instance
            .collection(_key_collection_user_logs)
            .doc(document.id)
            .update({_key_userId: document.id});
      });

      /**
                   * add user data into UserDataModel
                   */
      UserDataBox.instance.put_allUserData(
          id: user_id,
          name: userName,
          email: userEmail,
          imageUrl: userImageUrl,
          phoneNumber: phoneNumber,
          credintial: credintial,
          earned: earnedCash,
          recycledItems: recycledItems,
          savedCo2: savedCo2,
          loggedIn: true,
          reviewedBefore: reviewBefore);
    } catch (e) {
      CustomToast.showRedToast(messsage: "error : ${e.toString()}");
    }
  }

  /**
   * When user try to login with user name and password
   */
  Future<void> signInUser_withEmailAndPassword_thenStoreDataLocally(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    try {
      /**
                 * Sign in with email and password 
                 */
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        /**
                   * Fetch user data from FireStore .
                   */
        final result = await FirebaseFirestore.instance
            .collection(_key_collection_user_logs)
            .where(_key_userEmail, isEqualTo: emailController.text)
            .get()
            .then((value) async {
          /**
               * Get user document and store it in userDocument variable .
               */
          var userDocument = value.docs.map((e) => e.data()).first;
          /**
                 * add data to user data box .
                 */
          UserDataBox.instance.put_allUserData(
              id: userDocument[_key_userId],
              name: userDocument[_key_userName],
              email: userDocument[_key_userEmail],
              imageUrl: userDocument[_key_userImageUrl],
              phoneNumber: userDocument[_key_userPhoneNumber],
              credintial: userDocument[_key_userCredintial],
              earned: userDocument[_key_userEarnedCash],
              loggedIn: true,
              recycledItems: userDocument[_key_userRecycledItems],
              reviewedBefore: userDocument[_key_userReviewBefore],
              savedCo2: userDocument[_key_userSavedCo2]);
        });
      });
    } catch (e) {
      CustomToast.showRedToast(messsage: 'error : ${e.toString()}');
    }
  }

  /**
           * Register user in firebase Auth
           */
  Future<void> registerNewUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String credintial,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredintial) async {
        String userName = "${firstName} ${lastName}";
        /**
                       * Store user data in fireStore , but without id : 
                       */

        await uploadUserDataToFirestore_thenStoreDataLocally(
          userCredential: userCredintial,
          userName: userName,
          credintial: credintial,
          phoneNumber: phoneNumber,
          userEmail: email,
          userImageUrl:
              "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
        );
      });
    } on FirebaseException catch (e) {
      CustomToast.showRedToast(
          messsage: 'account already exist , just login !!');
      Get.back();
      throw FirebaseException(
          plugin: 'this account is already exist !! , login Directly');
    }
  }

  Future<void> updateUserName(
      {required BuildContext context, required String newName}) async {
    UserDataBox.instance.put_userName(userName: newName);
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: DefaultColors.defaultGreen),
        );
      },
    );
    try {
      await FirebaseFirestore.instance
          .collection(_key_collection_user_logs)
          .doc(UserDataBox.instance.get_id())
          .update({_key_userName: newName});
    } catch (e) {
      CustomToast.showRedToast(messsage: 'error : ${e.toString()}');
    }
    Get.back();
  }

  Future<void> updatePhoneNumber(
      {required BuildContext context, required String phoneNumber}) async {
    UserDataBox.instance.put_userPhoneNumber(phoneNumber: phoneNumber);
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(color: DefaultColors.defaultGreen),
        );
      },
    );
    await FirebaseFirestore.instance
        .collection(_key_collection_user_logs)
        .doc(UserDataBox.instance.get_id())
        .update({_key_userPhoneNumber: phoneNumber});
    Get.back();
  }
}
