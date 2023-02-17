import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SendFeedbackOption extends StatelessWidget {
  const SendFeedbackOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () {
        Get.toNamed(PagesNames.feedBackPage);
      },
      leading: Icon(
        Icons.feedback,
        color: Colors.purple[300],
      ),
      title: Text("Send feedback"),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 18.sp,
      ),
    );
  }
}
