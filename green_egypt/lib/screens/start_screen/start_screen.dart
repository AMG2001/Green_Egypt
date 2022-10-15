import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Hero(
                    tag: "cycle_icon",
                    child: Icon(
                      Icons.recycling_outlined,
                      color: Colors.green,
                      size: 56,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Green_Egypt 🍀',
                        speed: Duration(milliseconds: 500),
                        textStyle: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text("Don't have an Account !"),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    Get.toNamed(PagesNames.registerPage);
                  },
                  child: Text("Register")),
              SizedBox(
                height: 12,
              ),
              Text("Already have an Account !"),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    Get.toNamed(PagesNames.loginScreen);
                  },
                  child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
