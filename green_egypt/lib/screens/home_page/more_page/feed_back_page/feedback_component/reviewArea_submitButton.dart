import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/theme/application_theme.dart';
import 'package:green_egypt/config/theme/application_theme_controller.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/rounded_button.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_page_controller.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:quickalert/quickalert.dart';

class ReviewArea_SubmitButton extends StatelessWidget {
  ApplicationThemeController themeController =
      Get.put(ApplicationThemeController());
  late FeedbackPageController controller;
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  ReviewArea_SubmitButton({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: reviewFormKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Constants.kDefaultPadding),
            decoration: BoxDecoration(
                color: themeController.isDark
                    ? Colors.grey[100]!.withOpacity(.2)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0.0, 15.0),
                      color: DefaultColors.kTextColor.withAlpha(20))
                ]),
            child: TextFormField(
              validator: (value) {
                if (value == "" || value!.isEmpty) {
                  return 'you cant leave this Field empty';
                } else if (value.length <= 3) {
                  return 'this is not enough !!';
                }
              },
              onChanged: (value) => controller.setReview = value,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Additional comment',
                hintStyle: TextStyle(
                  color: DefaultColors.kTextLightColor,
                ),
              ),
            ),
          ),
          SizedBox(height: Constants.kDefaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Submit',
                style: TextStyle(
                    color: DefaultColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(width: Constants.kDefaultPadding),
              RoundedButton(
                  icon: Icon(Icons.arrow_forward),
                  iconColor: Colors.white,
                  bgColor: DefaultColors.kPrimaryColor,
                  tap: () {
                    if (reviewFormKey.currentState!.validate()) {
                      // print('user id : ${controller.userId}');
                      // print('user name : ${controller.userName}');
                      // print('user email : ${controller.userEmail}');
                      // print(
                      //     'user phone number : ${controller.userPhoneNumber}');
                      // print('user rating : ${controller.rating}');
                      // print('user review : ${controller.review}');
                      controller.uploadUserReview_OnFireStore(
                          review: controller.review,
                          userRatingsStars: controller.rating);
                    }
                  })
            ],
          ),
        ],
      ),
    );
  }
}