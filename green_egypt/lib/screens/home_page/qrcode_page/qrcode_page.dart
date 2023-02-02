import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
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

  List<String> homePagesNames = [
    PagesNames.homePage,
    PagesNames.qrcodePage,
    PagesNames.transactionsHistoryPage,
    PagesNames.morePage
  ];

  void navigateToPageWithIndex(int pageIndex) {
    pageIndex == 2
        ? Get.toNamed(homePagesNames[pageIndex])
        : Get.offNamed(homePagesNames[pageIndex]);
  }

  // void resumeCamera() async {
  //   await controller!.resumeCamera();
  // }

  // @override
  // void initState() {
  // resumeCamera();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // resumeCamera();
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: 1,
        curve: Curves.linear,
        iconSize: 20.sp,
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("home"),
              textAlign: TextAlign.center,
              activeColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded),
              title: Text(
                "qr code",
              ),
              textAlign: TextAlign.center,
              activeColor: DefaultColors.defaultGreen),
          BottomNavyBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              title: Text("Transactions"),
              textAlign: TextAlign.center,
              activeColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              title: Text("more"),
              textAlign: TextAlign.center,
              activeColor: Colors.black),
        ],
        onItemSelected: (value) {
          if (value == 3)
            Get.toNamed(PagesNames.morePage);
          else
            navigateToPageWithIndex(value);
        },
      ),
      body: Column(
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
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
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
