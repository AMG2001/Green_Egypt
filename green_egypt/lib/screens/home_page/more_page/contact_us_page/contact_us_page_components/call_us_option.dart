import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsOption extends StatelessWidget {
  const CallUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // will add any number as we need
        String phoneNumber = '+201096482183';

        final Uri params = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );

// Launch the URL with the phone number parameter.
        await launch(params.toString());
      },
      child: Column(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'assets/images/call.png',
                    height: 36,
                  ),
                ),
                Text('Call Us'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xfffec569),
                    )),
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
