import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:lottie/lottie.dart';

class RegisterPageController extends GetxController {
  var validationMode = AutovalidateMode.disabled;
  bool securePassword = true;
  FaIcon eyeIcon = FaIcon(FontAwesomeIcons.eyeSlash);
  Color eyeIconColor = Colors.grey;

  SignUpPageController() {
    eyeIcon = FaIcon(
      FontAwesomeIcons.eyeSlash,
      color: eyeIconColor,
    );
  }

  void changeShowPasswordValue() {
    securePassword = !securePassword;
    if (securePassword == true) {
      eyeIconColor = Colors.grey;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eyeSlash,
        color: eyeIconColor,
      );
    } else {
      eyeIconColor = Colors.green;
      eyeIcon = FaIcon(
        FontAwesomeIcons.eye,
        color: eyeIconColor,
      );
    }

    update();
  }

  void changeValidationMode() {
    /**
     * Keep tracking user input and validate it immediatly !! 🔥🤍
     */
    validationMode = AutovalidateMode.onUserInteraction;
    update();
  }

  Future<void> registerNewUser(
      {required BuildContext context,
      required TextEditingController emailController,
      required TextEditingController passwordController,
      required TextEditingController firstNameController,
      required TextEditingController lastNameController,
      required TextEditingController userNumberController}) async {
    /**
             * ############################## To remeber how it work #############################
             * Visit : https://tech-mavica.notion.site/Green-Egypt-Docs-73034b5905e444c2ae85761ff20a4d6f
             */
    try {
      /**
       * Show loading Indicator
       */
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          });
      /**
           * Register user in firebase Auth
           */
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) async {
        String userName =
            "${firstNameController.text} ${lastNameController.text}";
        /**
                     * Store all user data locally in UserDataModel .
                     */
        await UserDataModel.initiateUserDataModel(
                name: userName,
                email: emailController.text,
                userPhoneNumber: userNumberController.text,
                imageUrl:
                    "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")
            .then((value) async {
          /**
                       * Store user data in fireStore , but without id : 
                       */
          await FirebaseFirestore.instance.collection('user_logs').add({
            'user_name': userName,
            'user_first_name': firstNameController.text,
            'user_last_name': lastNameController.text,
            'user_email':emailController.text,
            'user_image_url':
                "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
            'user_phone_number': userNumberController.text
          }).then((value) async {
            /**
                     * update the same record by adding id to .
                     */
            await FirebaseFirestore.instance
                .collection('user_logs')
                .doc(value.id)
                .update({'user_id': value.id}).then((value) {
              /**
                     * Remove loading indicator
                     */
              Get.back();
              /**
 * Show animted success vector
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
                      child: Lottie.asset(
                          'assets/animated_vectors/register_success.json',
                          repeat: false),
                    );
                  });
            });
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      CustomToast.showRedToast(messsage: e.toString());
    }
  }
}
