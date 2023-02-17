import 'package:flutter/material.dart';
import 'package:green_egypt/services/custom_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpOption extends StatelessWidget {
  const HelpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () {
        CustomToast.showBlackToast(messsage: "This Function not added yet !");
      },
      leading: Icon(
        Icons.help,
        color: Colors.blue[300],
      ),
      title: Text("Help"),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
