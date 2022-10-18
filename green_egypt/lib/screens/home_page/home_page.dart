import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  UserDataModel.getImageUrl(),
                ),
                radius: 65.0,
              ),
              SizedBox(
                height: 24,
              ),
              Text("Name : ${UserDataModel.getUserName()}"),
              SizedBox(
                height: 24,
              ),
              Text("Email : ${UserDataModel.getUserEmail()}"),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.offNamed(PagesNames.loginScreen);
                  },
                  child: Text("Sign out"))
            ],
          ),
        ),
      ),
    );
  }
}
