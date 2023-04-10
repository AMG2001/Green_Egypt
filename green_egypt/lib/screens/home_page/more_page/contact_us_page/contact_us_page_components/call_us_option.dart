import 'package:flutter/material.dart';

class CallUsOption extends StatelessWidget {
  const CallUsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/call.png',
                  height: 36,
                ),
              ),
              Text("Call Us",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xfffec569),
                  )),
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
      ],
    );
  }
}
