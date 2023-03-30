import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/services/boxes/user_data_db.dart';
import 'package:green_egypt/services/console_message.dart';
import 'package:green_egypt/services/firebase_services/firebase_services.dart';
import 'package:lottie/lottie.dart';

class GoogleCustomAuth {
  static Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((userCredential) async {
      FirebaseCustomServices.instance.access_withGoogle_thenStoreDataLocally(
          userCredential: userCredential, context: context);
    });
  }
}
