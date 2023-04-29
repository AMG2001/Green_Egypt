import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailUsOption extends StatelessWidget {
  const EmailUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // will be
        String email = 'mohamadamgado9@gmail.com';
        String subject = 'User message';
        // body is the message that will be getted form message TF .
        String body =
            'Hi there, This message is Auto created by AMG , you can Edit it as you want .';
        final Uri params = Uri(
          scheme: 'mailto',
          path: email,
          query: 'subject=$subject&body=$body',
        );
        await launch(params.toString());
      },
      child: Column(
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/email.png',
                    height: 42,
                  ),
                ),
                Text('Email Us'.tr,
                    style: TextStyle(fontSize: 20, color: Color(0xff86c447))),
              ],
            ),
            height: 90,
            width: 100,
            decoration: BoxDecoration(
              color: ApplicationThemeController.instance.isDark
                  ? Colors.grey.withOpacity(.2)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 235, 225, 225)
                      .withOpacity(0.1), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
