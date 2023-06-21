import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class BarModel extends StatefulWidget {
  BarModel({required this.barText, required this.barHeight});
  late String barText;
  late double barHeight;
  double currentBarHeight = 50;
  @override
  State<BarModel> createState() => _BarModelState();
}

class _BarModelState extends State<BarModel> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        widget.currentBarHeight = widget.barHeight;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white70,
          ),
          width: Dimensions.width * .06,
          height: widget.currentBarHeight,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          widget.barText,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
