import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedbackHeader extends StatelessWidget {
  const FeedbackHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                ' GREEN EGYPT ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'How was Green Egypt Experience  ?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'we appreciate feedback about your experince',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            /**
         * Divider at end of Header
         */
            Divider(
              height: 1,
              color: Colors.black54,
            )
          ],
        ),
        width: Dimensions.width,
        alignment: Alignment.center,
      ),
    );
  }
}
