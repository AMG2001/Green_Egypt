import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final transitionPageAppBar = AppBar(
  title: Row(mainAxisSize: MainAxisSize.max, children: [
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Transactions'.tr,
        ),
        SizedBox(
          width: 12,
        ),
        Icon(
          Icons.history,
          size: 20.sp,
        )
      ],
    ),
    SizedBox(
      width: 16.w,
    )
  ]),
);
