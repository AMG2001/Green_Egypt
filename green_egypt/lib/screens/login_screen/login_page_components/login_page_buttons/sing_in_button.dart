import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';

class SignInButton extends StatelessWidget {
  TextEditingController emailController;
  TextEditingController passwordController;

  SignInButton(
      {required this.emailController, required this.passwordController});
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
        Get.toNamed(PagesNames.feedBackPage);
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
