import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScanAndEarnRow extends StatelessWidget {
  const ScanAndEarnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Now , Scan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 12,
        ),
        FaIcon(
          FontAwesomeIcons.qrcode,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          "And Earn",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 8,
        ),
        FaIcon(
          FontAwesomeIcons.moneyBill,
        )
      ],
    );
  }
}
