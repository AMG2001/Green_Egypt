import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';

class FaceBookAuthCustom {
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
            'user_email': value['email'],
            'user_name': value['name'],
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
                  // TODO try to solve User number problem via Facebook
                  userPhoneNumber: "",
                  email: value['email'],
                  name: value['name'],
                  imageUrl: value['picture']['data']['url']);
            }).then((value) => Get.offNamed(PagesNames.homePage));
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
}



/**
 * in error Code : 
 * /**
               * add user in firestore but without id
               */
          await FirebaseFirestore.instance.collection('user_logs').add({
            'user_email': value['email'],
            'user_name': value['name'],
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
                  // TODO try to solve User number problem via Facebook
                  userPhoneNumber: "",
                  email: value['email'],
                  name: value['name'],
                  imageUrl: value['picture']['data']['url']);
            }).then((value) => Get.offNamed(PagesNames.homePage));
          });
 */