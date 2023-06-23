import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';

import '../../../../config/dimensions.dart';
import '../controller/Container_model.dart';



class Transaction_model_Year extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
      color:ApplicationThemeController.instance.isDark?Colors.black:Colors.white,
        borderRadius: BorderRadius.circular(25),
        
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        
        children: [
          SizedBox(
            width: 15,
          ),
          /************************ Column Of Percentile Degrees ************************/
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "100%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "75%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "50%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "25%",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "0%",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          /************************ Model For Year ************************/
          SizedBox(width: 10),
          Container_model(
            content: 'Jan',
            Height: Dimensions.height * 0.15,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Feb',
            Height: Dimensions.height * 0.10,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Mar',
            Height: Dimensions.height * 0.09,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Apr',
            Height: Dimensions.height * 0.14,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'May',
            Height: Dimensions.height * 0.11,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Jun',
            Height: Dimensions.height * 0.09,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Jul',
            Height: Dimensions.height * 0.16,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Aug',
            Height: Dimensions.height * 0.10,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Sep',
            Height: Dimensions.height * 0.13,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Oct',
            Height: Dimensions.height * 0.09,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Nov',
            Height: Dimensions.height * 0.12,
          ),
          SizedBox(width: 20),
          Container_model(
            content: 'Dec',
            Height: Dimensions.height * 0.14,
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
