import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';

class SignUpButton extends StatelessWidget {
  final registerPageController = Get.put(RegisterPageController());
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
            await registerPageController.registerNewUser(
                context: context,
                emailController: emailController,
                passwordController: passwordController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                userNumberController: userNumberController);
          }
        },
      ),
    );
  }
}
