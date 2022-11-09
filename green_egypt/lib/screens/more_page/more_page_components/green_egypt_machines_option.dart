import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GreenEgyptMachinesOption extends StatelessWidget {
  const GreenEgyptMachinesOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.location_on_outlined,
        color: Colors.green,
      ),
      title: Text("Green Egypt machines Locations"),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.sp,
        color: Colors.grey,
      ),
    );
  }
}
