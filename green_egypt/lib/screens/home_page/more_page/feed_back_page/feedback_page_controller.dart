import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:quickalert/quickalert.dart';
import 'package:intl/intl.dart';

class FeedbackPageController extends GetxController {
  late String userName;
  // late String userPoints;
  late String userImageUrl;
  late String userEmail;
  late String userPhoneNumber;
  late String userId;
  late String review;
  late int rating;
  late BuildContext context;
  get getReview => this.review;

  set setReview(String review) => this.review = review;

  get getRating => this.rating;

  set setRating(int rating) => this.rating = rating;

  FeedbackPageController({required this.context}) {
    userName = UserDataModel.userName;
    userImageUrl = UserDataModel.userImageURL;
    userEmail = UserDataModel.userEmail;
    userPhoneNumber = UserDataModel.userNumber;
    userId = UserDataModel.userId;
    rating = 0;
    review = "";
  }

  void uploadUserReview_OnFireStore(
      {required String review, required int userRatingsStars}) async {
    showLoadingIdicator();
    uploadReveiwToFirestore().then((value) {
      showSuccessAnimation();
    });
  }

  /**
   * First show circular loading indicator .
   */
  void showLoadingIdicator() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        });
  }

  /**
   * then start upload all data to fire store
   */
  Future<void> uploadReveiwToFirestore() async {
    String currentDateAndTime = DateFormat.yMd().format(DateTime.now()) +
        " at " +
        DateFormat.jm().format(DateTime.now());
    FirebaseFirestore.instance.collection('users_reviews').add({
      'user_email': userEmail,
      'user_id': userId,
      'user_name': userName,
      'user_phone_number': userPhoneNumber,
      'user_review': review,
      'review_date_and_time': currentDateAndTime
    });
  }

  /**
   * 3. show success animation .
   */
  void showSuccessAnimation() {
    Get.back();
    QuickAlert.show(
      title: "your review sent successfully",
      animType: QuickAlertAnimType.slideInRight,
      confirmBtnColor: DefaultColors.kPrimaryColor,
      context: context,
      type: QuickAlertType.success,
    );
  }
}
