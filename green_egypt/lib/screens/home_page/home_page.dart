import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/screens/home_page/home_page_controller.dart';
import 'package:green_egypt/screens/home_page/home_screen/home_screen.dart';
import 'package:green_egypt/screens/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/transactions_page/transactions_page.dart';
import 'package:green_egypt/screens/more_page/more_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    activeColor: controller.currentIndex == 0
                        ? Color(0xFF9E9ED1)
                        : Colors.black),
                BottomNavyBarItem(
                    icon: Icon(Icons.qr_code_scanner_rounded),
                    title: Text("qr code"),
                    textAlign: TextAlign.center,
                    activeColor: controller.currentIndex == 1
                        ? Colors.blueAccent
                        : Colors.black),
                BottomNavyBarItem(
                    icon: Icon(Icons.bookmarks_outlined),
                    title: Text("Transactions"),
                    textAlign: TextAlign.center,
                    activeColor: controller.currentIndex == 2
                        ? Color(0xFFFFCA38)
                        : Colors.black),
                BottomNavyBarItem(
                    icon: Icon(Icons.more_horiz_outlined),
                    title: Text("more"),
                    textAlign: TextAlign.center,
                    activeColor: controller.currentIndex == 3
                        ? Color(0xFFFF7870)
                        : Colors.black),
              ],
              onItemSelected: (value) {
                setState(() {
                  controller.currentIndex = value;
                });
              },
            ),
            body: SafeArea(
              child: controller.pages[controller.currentIndex],
            ),
          );
        });
  }
}
