import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/services/custom_toast.dart';

import '../../../../../config/dimensions.dart';

class ChatOption extends StatelessWidget {
  const ChatOption({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomToast.showBlackToast(
            messsage: 'this Functionallity will be added soon');
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
                    'assets/images/chat.png',
                    height: Dimensions.height*0.068,
                  ),
                ),
                Text(
                  'Chat'.tr,
                  style: TextStyle(fontSize: 20, color: Color(0xff800080)),
                ),  
              ],
            ),
           height: Dimensions.height*0.1,
           width: Dimensions.width*0.3,
            decoration: BoxDecoration(
              color: ApplicationThemeController.instance.isDark
                  ?  Colors.black 
                  :  Colors.white , 
              borderRadius: BorderRadius.circular(10), //border corner radius
             
            ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}
