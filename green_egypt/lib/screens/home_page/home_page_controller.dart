import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page.dart';

class HomePageController extends GetxController {
  int currentIndex = 0;
  List<String> homePagesNames = [
    PagesNames.homePage,
    PagesNames.qrcodePage,
    PagesNames.transactionsHistoryPage,
    PagesNames.morePage
  ];

  void navigateToPageWithIndex(int pageIndex) {
    Get.offNamed(homePagesNames[pageIndex]);
  }
  
}
