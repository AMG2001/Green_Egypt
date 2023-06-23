import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/dimensions.dart';
import '../../../../config/theme/application_theme_controller_box.dart';
import '../controller/Container_model.dart';





class Transaction_model_month extends StatelessWidget {
  const Transaction_model_month({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      
      decoration: BoxDecoration(
                      color:ApplicationThemeController.instance.isDark?Colors.black:Colors.white,

        borderRadius: BorderRadius.circular(25),
       
      ),

      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
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

          /************************ Model For Month ************************/
          Container_model(
              content: 'Week 1',
              Height: Dimensions.height * 0.125),
          Container_model(
              content: 'Week 2', Height: Dimensions.height * 0.09),
          Container_model(
              content: 'Week 3', Height: Dimensions.height * 0.14),
          Container_model(
              content: 'Week 4', Height: Dimensions.height * 0.11),
        ],
      ),
    );
  }
}
