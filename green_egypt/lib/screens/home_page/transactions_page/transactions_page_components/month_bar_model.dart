import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class MonthBarModel extends StatelessWidget {
  MonthBarModel({required this.month, required this.barHeight});
  late String month;
  late double barHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white70,
          ),
          width: Dimensions.width * .06,
          height: barHeight,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          month,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
