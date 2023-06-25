import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class CashQrcode extends StatelessWidget {
  const CashQrcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          child: SfBarcodeGenerator(
            value: '35 Points : 4.5 le',
            symbology: QRCode(),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "35 point : 12 le",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
