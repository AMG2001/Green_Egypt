import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';

class HomePageController extends GetxController {
  List<String> homePagesNames = [
    PagesNames.homePage,
    PagesNames.qrcodePage,
    PagesNames.transactionsHistoryPage,
    PagesNames.morePage
  ];

  
}
