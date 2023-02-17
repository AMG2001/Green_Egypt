import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguageOption extends StatefulWidget {
  const LanguageOption({super.key});

  @override
  State<LanguageOption> createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<LanguageOption> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: () {},
      leading: Icon(
        Icons.language_rounded,
        color: Colors.purple[300],
      ),
      title: Text("Language"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "English",
            style: TextStyle(color: Colors.grey[500]),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
