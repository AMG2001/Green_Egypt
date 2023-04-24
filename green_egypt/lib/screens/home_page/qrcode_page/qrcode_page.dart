import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QrCodePageBody extends StatefulWidget {
  const QrCodePageBody({super.key});

  @override
  State<QrCodePageBody> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePageBody> {
  int _pageIndex = 1;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    // resumeCamera();
    return GetBuilder<ApplicationThemeController>(builder: (themeController) {
      return Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red, borderRadius: 16.0),
              cameraFacing: CameraFacing.back,
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}  \nData: ${result!.code}')
                  : Text('Scan a code'.tr),
            ),
          )
        ],
      );
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        // TODO : get data from QR and store points into user Points .
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
