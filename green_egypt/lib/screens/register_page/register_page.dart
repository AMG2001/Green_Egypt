import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/screens/register_page/register_page_controller.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/email_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/first_name_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/last_name_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/page_header.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/password_text_field.dart';
import 'package:green_egypt/screens/register_page/regsiter_page_components.dart/sign_up_button.dart';

class RegisterPage extends StatelessWidget {
  final signUpPageController =
      Get.put(RegisterPageController(), permanent: true);
  GlobalKey<FormState> sigUpFormState = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              /**
               * main Column
               */
              child: GetBuilder<RegisterPageController>(
                  init: RegisterPageController(),
                  builder: (controller) {
                    return Form(
                      autovalidateMode: controller.validationMode,
                      key: sigUpFormState,
                      child: Container(
                        width: Dimensions.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.green,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                            /**
                       * Page Header Widget
                       */
                            PageHeader(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /**
                           * First Name TF Column
                           */
                                FirstNameTF(
                                    firstNameController: firstNameController),
                                /**
                           * Last Name TF Column
                           */
                                LastNameTF(
                                    lastNameController: lastNameController),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Text("Email"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            /**
                       * Email TF
                       */
                            EmailTF(emailController: emailController),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            /**
                               * Password TF
                               */

                            Text("Password"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            PasswordTF(
                                passwordController: passwordController,
                                signUpPageController: signUpPageController),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            SignUpButton(
                                sigUpFormState: sigUpFormState,
                                emailController: emailController,
                                passwordController: passwordController,
                                firstNameController: firstNameController,
                                lastNameController: lastNameController)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
