import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:lottie/lottie.dart';

class SignInButton extends StatelessWidget {
  TextEditingController emailController;
  GlobalKey<FormState> loginKey;
  TextEditingController passwordController;

  SignInButton(
      {required this.emailController,
      required this.passwordController,
      required this.loginKey});
  @override
  Widget build(BuildContext context) {
    /**
     * Sign in Button
     */
    return ElevatedButton(
      /**
       * Button Styling
       */
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      ),
      /**
       * Button Action
       */
      onPressed: () async {
        if (loginKey.currentState!.validate()) {
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
                 * Sign in with email and password 
                 */
            await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text)
                .then((value) async {
              /**
                   * Fetch user data from FireStore .
                   */
              final result = await FirebaseFirestore.instance
                  .collection('user_logs')
                  .where('user_email', isEqualTo: emailController.text)
                  .get()
                  .then((value) async {
                /**
               * Get user document and store it in userDocument variable .
               */
                var userDocument = value.docs.map((e) => e.data()).first;
                /**
               * initialize user data model .
               */
                await UserDataModel.initiateUserDataModel(
                  userCredintialArg: userDocument['user_credintial'],
                        name: userDocument['user_name'],
                        email: userDocument['user_email'],
                        imageUrl: userDocument['user_image_url'],
                        userPhoneNumber: userDocument['user_phone_number'])
                    .then((value) {
                  /**
               * Remove loading indicator
               */
                  Get.back();
                  /**
           * Show success animation
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
                          Get.offAllNamed(PagesNames.homePage);
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
          } on FirebaseAuthException catch (e) {
            /**
             * Remove loading indicator
             */
            Get.back();
            if (e.code == 'user-not-found') {
              CustomToast.showRedToast(
                  messsage: 'No user found for that email.');
            } else if (e.code == 'wrong-password') {
              CustomToast.showRedToast(
                  messsage: 'Wrong password provided for that user.');
            }
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
