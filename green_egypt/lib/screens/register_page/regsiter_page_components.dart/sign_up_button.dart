import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';
import 'package:lottie/lottie.dart';

class SignUpButton extends StatelessWidget {
  final signUpPageController = Get.put(RegisterPageController());
  SignUpButton({
    Key? key,
    required this.sigUpFormState,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.userNumberController,
  }) : super(key: key);

  final GlobalKey<FormState> sigUpFormState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController userNumberController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Register now"),
            SizedBox(
              width: 10,
            ),
            FaIcon(
              FontAwesomeIcons.arrowRight,
              size: 16,
            )
          ],
        ),
        onPressed: () async {
          if (sigUpFormState.currentState!.validate()) {
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
           * Register user in firestore
           */
            await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text)
                .then((value) async {
              String userName =
                  "${firstNameController.text} ${lastNameController.text}";
              await UserDataModel.initiateUserDataModel(
                      name: userName,
                      email: emailController.text,
                      userPhoneNumber: userNumberController.text,
                      imageUrl:
                          "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")
                  .then((value) {
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
          } else {
            signUpPageController.changeValidationMode();
          }
        },
      ),
    );
  }
}
