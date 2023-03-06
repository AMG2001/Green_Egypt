import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/app_header.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/custom_app_bar.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/main_button.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/multiline_input.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/points.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class FeedbackPage extends StatelessWidget {
  double userStarsRating = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AppHeader(),
            Positioned(
                top: -380,
                left: -187,
                child: Opacity(
                    opacity: 0.9, child: Image.asset('assets/images/bg.png'))),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.all(Constants.kDefaultPadding),
              child: Column(
                children: [
                  CustomAppBar(),
                  SizedBox(height: Constants.kDefaultPadding * 4),
                  CircleAvatar(
                    backgroundImage: NetworkImage(UserDataModel.userImageURL),
                    radius: 70,
                  ),
                  SizedBox(height: Constants.kDefaultPadding),
                  Divider(
                    color: DefaultColors.kTextLightColor,
                  ),
                  SizedBox(height: Constants.kDefaultPadding),
                  PointStats(),
                  SizedBox(height: Constants.kDefaultPadding),
                  Divider(
                    color: DefaultColors.kTextLightColor,
                  ),
                  SizedBox(height: Constants.kDefaultPadding),
                  Text(
                    'Hi , ' + UserDataModel.userName,
                    style: TextStyle(
                      color: DefaultColors.kTextLightColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'How Would You Rate Our App?',
                    style: TextStyle(
                        color: DefaultColors.kTextColor, fontSize: 18),
                  ),
                  SizedBox(height: Constants.kDefaultPadding),
                  StatefulBuilder(builder: (context, setState) {
                    return SmoothStarRating(
                      spacing: Constants.kDefaultPadding,
                      allowHalfRating: false,
                      color: DefaultColors.defaultGreen,
                      onRatingChanged: (v) {
                        setState(() {
                          userStarsRating = v;
                        });
                      },
                      starCount: 5,
                      rating: userStarsRating,
                      size: 45.0,
                    );
                  }),
                  SizedBox(height: Constants.kDefaultPadding),
                  MultilineInput(),
                  SizedBox(height: Constants.kDefaultPadding),
                  MainButton()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
