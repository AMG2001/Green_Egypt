import 'package:flutter/material.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/vectos_paths.dart';
import 'package:lottie/lottie.dart';

class CustomAnimations {
  static void showSuccessAnimation(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            /**
               * after showing animation , move to page you want
               */
            Navigator.pushReplacementNamed(context, PagesNames.homePage);
          });
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Lottie.asset(VectorsPaths.processSuccessAnimation),
          );
        });
  }
}
