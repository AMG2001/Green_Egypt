import 'package:flutter/material.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/screens/home_page/more_page/feed_back_page/feedback_component/rounded_button.dart';
import 'package:quickalert/quickalert.dart';

class MainButton extends StatefulWidget {
  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Submit',
          style: TextStyle(
              color: DefaultColors.defaultGreen,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        SizedBox(width: Constants.kDefaultPadding),
        RoundedButton(
            icon: Icon(Icons.arrow_forward),
            iconColor: Colors.white,
            bgColor: DefaultColors.defaultGreen,
            tap: () {
              QuickAlert.show(
                title: "your review sent successfully",
                animType: QuickAlertAnimType.slideInRight,
                confirmBtnColor: DefaultColors.defaultGreen,
                context: context,
                type: QuickAlertType.success,
              );
            })
      ],
    );
  }
}
