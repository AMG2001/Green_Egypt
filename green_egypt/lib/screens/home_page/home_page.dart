import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/screens/home_page/home_page_components/card_of_earned_saved_recycled.dart';
import 'package:green_egypt/screens/home_page/home_page_components/eco_friendly_tips_row.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_actions.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_animations_controller.dart';
import 'package:green_egypt/screens/home_page/home_page_components/home_page_title.dart';
import 'package:green_egypt/screens/home_page/home_page_components/list_of_categories_items.dart';
import 'package:green_egypt/screens/home_page/home_page_components/list_of_friendly_tips.dart';
import 'package:green_egypt/screens/home_page/home_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  final homePageAnimationsController = Get.put(HomePageAnimationsController());
  final homePageController = Get.put(HomePageController());
  HomePage({super.key});

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
    pageIndex == 2
        ? Get.toNamed(homePagesNames[pageIndex])
        : Get.offNamed(homePagesNames[pageIndex]);
    Get.offNamed(homePagesNames[pageIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                actions: [HomePageActions()],
                elevation: 0,
                backgroundColor: Colors.white,
                title: HomePageTitle()),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: controller.currentIndex,
              curve: Curves.linear,
              iconSize: 20.sp,
              items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.home_outlined),
                    title: Text("home"),
                    textAlign: TextAlign.center,
                    activeColor: Color(0xFF90AD19)),
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
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Container(
                  width: Dimensions.width,
                  height: Dimensions.height,
                  child: Column(
                    children: [
                      CardOfEarnedSavedRecycled(),
                      Row(
                        children: [
                          Text(
                            "Waste Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                fontFamily:
                                    DefaultFonts.defaultLondrinaSolidThin),
                          )
                        ],
                      ),
                      /**
                       * Horizontal list of categories as plastic , glass and paper
                       */
                      ListOfCategoriesItems(),
                      /**
                       * Eco friendly tips row with view all option
                       */
                      EcoFriendlyTipsRow(),
                      /**
                       * Vertical list of friendly tips
                       */
                      ListOfFriendlyTips()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
