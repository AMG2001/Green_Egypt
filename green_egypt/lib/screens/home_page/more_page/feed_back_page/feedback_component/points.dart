import 'package:flutter/material.dart';
import 'package:green_egypt/config/theme/default_colors.dart';

class PointStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PointInfo(
          title: 'collect:',
          value: '15 point',
        ),
        PointInfo(
          title: 'Price:',
          value: '\$9.99',
        ),
      ],
    );
  }
}

class PointInfo extends StatelessWidget {
  const PointInfo({
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title + '\n',
          style: TextStyle(color: DefaultColors.kTextLightColor, fontSize: 14)),
      Text(value,
          style: TextStyle(
              color: DefaultColors.kTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
    ]);
  }
}
