import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/vectos_paths.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(VectorsPaths.signUpAnimation,
              height: Dimensions.height * .35),
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
          style: TextStyle(fontSize: 18.sp, color: Colors.green),
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
