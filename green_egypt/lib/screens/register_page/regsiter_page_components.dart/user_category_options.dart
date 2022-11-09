import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class UserCategoryOptions extends StatelessWidget {
  int groupValue;
  UserCategoryOptions({required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, setState) {
        return Row(
          children: [
            Text("Regsiter as :  "),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all<Color>(Colors.green),
                  value: 1,
                  groupValue: groupValue,
                  onChanged: ((value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
                ),
                Text("Default User")
              ],
            ),
            SizedBox(
              width: Dimensions.width * .06,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  fillColor: MaterialStateProperty.all<Color>(Colors.green),
                  value: 2,
                  groupValue: groupValue,
                  onChanged: ((value) {
                    setState(() {
                      groupValue = value!;
                    });
                  }),
                ),
                Text("Staff")
              ],
            ),
          ],
        );
      }),
    );
  }
}
