import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/theme/application_theme_controller_box.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_animations_controller.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_appbar.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_body.dart';
import 'package:green_egypt/screens/home_page/home_page_controller.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page_appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:badges/badges.dart' as badges;
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/transition_page_appbar.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_body.dart';

class HomePage extends StatefulWidget {
  final homePageAnimationsController = Get.put(HomePageAnimationsController());
  final homePageController = Get.put(HomePageController());
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
              appBar: _pageIndex == 0
                  ? homePageAppBar
                  : _pageIndex == 1
                      ? qrcodePageAppbar
                      : _pageIndex == 2
                          ? transitionPageAppBar
                          : AppBar(
                              title: Text('more page'.tr),
                            ),
              bottomNavigationBar: GetBuilder<ApplicationThemeController>(
                  builder: (themeController) {
                return BottomNavyBar(
                  backgroundColor: ApplicationThemeController.instance.isDark
                      ? Colors.black
                      : Colors.white,
                  selectedIndex: _pageIndex,
                  curve: Curves.linear,
                  iconSize: 20.sp,
                  items: [
                    BottomNavyBarItem(
                        icon: Icon(
                          Icons.home_outlined,
                          size: 24,
                        ),
                        title: Text('home'.tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                    BottomNavyBarItem(
                        icon: Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 24,
                        ),
                        title: Text("qr code".tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                    BottomNavyBarItem(
                        icon: Icon(
                          Icons.bookmarks_outlined,
                          size: 24,
                        ),
                        title: Text("Transactions".tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                    BottomNavyBarItem(
                        icon: Icon(
                          Icons.more_horiz_outlined,
                          size: 24,
                        ),
                        title: Text("more".tr),
                        textAlign: TextAlign.center,
                        activeColor: Color(0xFF90AD19),
                        inactiveColor:
                            ApplicationThemeController.instance.isDark
                                ? Colors.white
                                : Colors.black),
                  ],
                  onItemSelected: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                );
              }),
              body: _pageIndex == 0
                  ? homePageBody
                  : _pageIndex == 1
                      ? QrCodePageBody()
                      : _pageIndex == 2
                          ? TransactionPageBody()
                          : _pageIndex == 3
                              ? MorePageBody()
                              : SizedBox());
        });
  }
}
