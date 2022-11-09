import 'package:flutter/material.dart';
import 'package:green_egypt/config/dimensions.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.width,
        height: Dimensions.height,
        child: Image(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/qrcode_page.jpeg'),
        ));
  }
}
