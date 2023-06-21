import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionsPageTitleRow extends StatelessWidget {
  const TransactionsPageTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: Dimensions.width * .05,
          ),
          Text(
            'Transactions'.tr,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.history,
            color: Colors.white,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
