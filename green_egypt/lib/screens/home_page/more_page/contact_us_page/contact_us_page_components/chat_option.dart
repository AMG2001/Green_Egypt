import 'package:flutter/material.dart';
import 'package:green_egypt/services/custom_toast.dart';

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
                    height: 36,
                  ),
                ),
                Text(
                  "Chat",
                  style: TextStyle(fontSize: 20, color: Color(0xff800080)),
                ),
              ],
            ),
            height: 90,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
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
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}
