import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width,
      height: Dimensions.height,
      child: Center(
        child: Text("Transactions Page"),
      ),
    );
  }
}
