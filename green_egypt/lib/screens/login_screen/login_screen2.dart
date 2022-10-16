import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/home_page/home_page.dart';
import 'package:green_egypt/utils/fire_auth.dart';
import 'package:green_egypt/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPass = FocusNode();
  bool _isprocessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPass.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("  LOGIN PAGE "),
        ),
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /**
                         * Email Text Field
                         */
                Form(
                  key: emailKey,
                  child: TextFormField(
                    controller: _emailTextController,
                    focusNode: _focusEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: "Email Adress",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      Validator.validateEmail(email: value!);
                    },
                  ),
                ),
                SizedBox(height: 10),
                /**
                         * Password Text Field
                         */
                Form(
                  key: passKey,
                  child: TextFormField(
                    controller: _passwordTextController,
                    focusNode: _focusPass,
                    obscureText: true,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Password",
                    ),
                    validator: (value) {
                      Validator.validatePassword(password: value!);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: (() async {
                      _focusEmail.unfocus();
                      _focusPass.unfocus();
                      if (emailKey.currentState!.validate() &&
                          passKey.currentState!.validate()) {
                        setState(() {
                          _isprocessing = true;
                        });
                        User? user = await fireAuth.signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text);
                        setState(() {
                          _isprocessing = false;
                        });
                        /**
                         * Navigate to Home page after login Finished ✔👀🤍
                         */
                        Get.offNamed(PagesNames.homePage);
                      }
                    }),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
