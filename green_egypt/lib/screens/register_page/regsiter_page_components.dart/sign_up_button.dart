import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';

class SignUpButton extends StatelessWidget {
  final signUpPageController = Get.put(RegisterPageController());
  SignUpButton({
    Key? key,
    required this.sigUpFormState,
    required this.emailController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
  }) : super(key: key);

  final GlobalKey<FormState> sigUpFormState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

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
            //   await FirebaseAuth.instance
            //       .createUserWithEmailAndPassword(
            //           email: emailController.text,
            //           password: passwordController.text)
            //       .then((value) async {
            //     String userName =
            //         "${firstNameController.text} ${lastNameController.text}";
            //     await UserLogs.settingUserInfo(
            //             userName: userName,
            //             email: emailController.text,
            //             photoUrl:
            //                 "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg")
            //         .then((value) async {
            //       await UserLoggedController.loggingUser().then((value) =>
            //           Get.offNamed(PagesNames.homePageScreenName));
            //     });
            //   });
          } else {
            signUpPageController.changeValidationMode();
          }
        },
      ),
    );
  }
}
