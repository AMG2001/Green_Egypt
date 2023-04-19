import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:lottie/lottie.dart';

class ContactUsPageHeader extends StatelessWidget {
  const ContactUsPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.green,
                ),
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(15), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              child: SizedBox(
            child: Lottie.asset(
                'assets/animated_vectors/contact_us_animation.json'),
          )),
          Container(
            alignment: Alignment.center,
            child: Text('Contact Us'.tr,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: Dimensions.height * .04,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '🍀 Our Team Would like To Hear You ! 🍀'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
