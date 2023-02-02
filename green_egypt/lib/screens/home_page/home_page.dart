import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/config/theme/application_theme.dart';
import 'package:green_egypt/config/theme/default_colors.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';
import 'package:green_egypt/config/user_data_model/user_data_model.dart';
import 'package:green_egypt/screens/home_page/home_page_components/card_of_earned_saved_recycled.dart';
import 'package:green_egypt/screens/home_page/home_page_components/categories_list_item.dart';
import 'package:green_egypt/screens/home_page/home_page_components/eco_friendly_tips_row.dart';
import 'package:green_egypt/screens/home_page/home_page_components/friendly_tips_item.dart';
import 'package:green_egypt/screens/home_page/home_page_components/list_of_categories_items.dart';
import 'package:green_egypt/screens/home_page/home_page_components/list_of_friendly_tips.dart';
import 'package:green_egypt/screens/home_page/home_page_controller.dart';
import 'package:green_egypt/screens/home_page/qrcode_page/qrcode_page.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page.dart';
import 'package:green_egypt/screens/home_page/more_page/more_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: badges.Badge(
                        child: Icon(
                          Icons.notifications,
                          color: DefaultColors.defaultBlack,
                          size: 28,
                        ),
                        position: badges.BadgePosition.custom(top: 0),
                        badgeStyle: badges.BadgeStyle(
                            badgeColor: DefaultColors.defaultGreen),
                      ),
                    ),
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Container(
                    height: 36,
                    width: 48,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(UserDataModel.userImageURL)),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Hello , ${UserDataModel.userName}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: DefaultFonts.defaultLondrinaSolidThin),
                  ),
                ],
              ),
            ),
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
                      CardOfEarnedSavedRecycled(
                          earned: '1250', saved: '350', recycled: '17'),
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
