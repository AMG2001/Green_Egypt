import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Center(
        child: Text("More Page"),
      ),
    );
  }
}
