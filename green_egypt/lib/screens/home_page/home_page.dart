import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/home_page/home_page_controller.dart';
import 'package:green_egypt/screens/home_page/home_screen/home_screen.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> homePagesNames = [
    PagesNames.homePage,
    PagesNames.qrcodePage,
    PagesNames.transactionsHistoryPage,
    PagesNames.morePage
  ];

  void navigateToPageWithIndex(int pageIndex) {
    Get.offNamed(homePagesNames[pageIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: controller.currentIndex,
              curve: Curves.linear,
              iconSize: 20.sp,
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.home_outlined),
                    title: Text("home"),
                    textAlign: TextAlign.center,
                    activeColor: Color(0xFF9E9ED1)),
                BottomNavyBarItem(
                    icon: Icon(Icons.qr_code_scanner_rounded),
                    title: Text("qr code"),
                    textAlign: TextAlign.center,
                    activeColor: Colors.black),
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
            body: SafeArea(
              child: Container(
                width: Dimensions.width,
                height: Dimensions.height,
              ),
            ),
          );
        });
  }
}
