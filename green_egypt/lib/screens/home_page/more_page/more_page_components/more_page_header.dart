import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MorePageHeader extends StatelessWidget {
  const MorePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height * .32,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        // TODO
        CircleAvatar(
          backgroundImage: NetworkImage(UserDataModel.userImageURL),
          radius: 65,
          // child: CachedNetworkImage(
          //   // imageBuilder: (context, imageProvider) => Container(
          //   //   decoration: BoxDecoration(
          //   //     borderRadius: BorderRadius.circular(25),
          //   //     image: DecorationImage(
          //   //       image: imageProvider,
          //   //       fit: BoxFit.cover,
          //   //     ),
          //   //   ),
          //   // ),
          //   imageUrl: UserDataModel.userImageURL,
          //   width: Dimensions.width * .35,
          //   progressIndicatorBuilder: (context, url, downloadProgress) =>
          //       CircularProgressIndicator(value: downloadProgress.progress),
          //   errorWidget: (context, url, error) => Icon(
          //     Icons.error,
          //     color: Colors.red,
          //   ),
          // ),
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Text(
          "${UserDataModel.userName}",
          style: TextStyle(fontSize: 16.sp),
        ),
        SizedBox(
          height: Dimensions.height * .02,
        ),
        Text(
          "user account : ${UserDataModel.userEmail}",
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        SizedBox(
          height: 16,
        ),
        FittedBox(
          child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Edit Profile"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                  )
                ],
              )),
        )
      ]),
    );
  }
}
