import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MorePageHeader extends StatelessWidget {
  const MorePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: Dimensions.height * .25,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          child: CircleAvatar(
            radius: 65,
            backgroundImage: NetworkImage(UserDataModel.userImageURL),
          ),
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Text(
          UserDataModel.userName,
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Text(
          UserDataModel.userEmail,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        )
      ]),
    );
  }
}
