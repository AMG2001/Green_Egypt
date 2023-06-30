import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';
import 'Container_model.dart';


class Transaction_model_week extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ApplicationThemeController.instance.isDark
                  ? Colors.black
                  : Colors.white ,  
        
      ),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /************************ Column Of Percentile Degrees ************************/
          Column(
            children: [
              SizedBox(
                height: Dimensions.height * 0.03
              ),
              Text(
                "100%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: Dimensions.height * 0.02
              ),
              Text(
                "75%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: Dimensions.height * 0.02
              ),
              Text(
                "50%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: Dimensions.height * 0.02
              ),
              Text(
                "25%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: Dimensions.height * 0.02
              ),
              Text(
                "0%",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          /************************ Model For Week ************************/
          Container_model(
              content: 'Sat', Height: Dimensions.height * 0.15),
          Container_model(
              content: 'San', Height: Dimensions.height * 0.12),
          Container_model(
              content: 'Mon', Height: Dimensions.height * 0.13),
          Container_model(
              content: 'Tue', Height: Dimensions.height * 0.11),
          Container_model(
              content: 'Wed', Height: Dimensions.height * 0.09),
          Container_model(
              content: 'Thu', Height: Dimensions.height * 0.14),
          Container_model(
              content: 'Fai', Height: Dimensions.height * 0.11),
        ],
      ),
    );
  }
}
