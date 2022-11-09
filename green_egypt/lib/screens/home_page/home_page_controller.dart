import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/home_screen/home_screen.dart';
import 'package:green_egypt/screens/more_page/more_page.dart';
import 'package:green_egypt/screens/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/transactions_page/transactions_page.dart';

class HomePageController extends GetxController {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    QrCodePage(),
    TransactionPage(),
    MorePage()
  ];
}
