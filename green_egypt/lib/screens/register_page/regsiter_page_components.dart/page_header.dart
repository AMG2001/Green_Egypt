import 'package:flutter/material.dart';
import 'package:green_egypt/config/constants.dart';
import 'package:lottie/lottie.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
          tag: Constants.recyclingIconTag,
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.recycling_outlined,
              color: Colors.green,
              size: 108,
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        /**
                         * Welcome message
                         */
        Align(
          alignment: Alignment.center,
          child: Text(
            "🍀 Regsiter now to be one of Green_Egypt Family 🍀",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        /**
                         * Sign up now message
                         */
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        Text(
          "Enter your Details : ",
          style: TextStyle(fontSize: 18, color: Colors.green),
        ),

        /**
                             * Row of first and last name
                             */
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
      ],
    );
  }
}
