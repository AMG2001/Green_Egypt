import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height,
        child: Image(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/images/main_page.jpeg"),
        ));
  }
}

/**
 * Column(
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
                await FirebaseAuth.instance.signOut().then((value) async {
                  await UserDataModel.userLoggedOut()
                      .then((value) => Get.offNamed(PagesNames.loginScreen));
                });
              },
              child: Text("Sign out"))
        ],
      ),
 */