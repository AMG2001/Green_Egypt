import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_egypt/config/dimensions.dart';
import 'package:green_egypt/config/pages_names.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/bottom_container.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/month_bar_model.dart';
import 'package:green_egypt/screens/home_page/transactions_page/transactions_page_components/transactions_page_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white)),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Transactions"),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.history,
                    size: 20.sp,
                  )
                ],
              ),
              SizedBox(
                width: 16.w,
              )
            ]),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: 2,
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
              title: Text("qr code"),
              textAlign: TextAlign.center,
              activeColor: Colors.black),
          BottomNavyBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              title: Text("Transactions"),
              textAlign: TextAlign.center,
              activeColor: Color(0xFFFFCA38)),
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
      body: Container(
        width: Dimensions.width,
        height: Dimensions.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.white])),
                width: Dimensions.width,

                /**
                   * it will be coded later
                 */

                child: Column(
                  children: [
                    TransactionsPageHeader(),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MonthBarModel(
                          month: "Jan",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Feb",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Mar",
                          barHeight: Dimensions.height * .1,
                        ),
                        MonthBarModel(
                          month: "Apr",
                          barHeight: Dimensions.height * .09,
                        ),
                        MonthBarModel(
                          month: "May",
                          barHeight: Dimensions.height * .08,
                        ),
                        MonthBarModel(
                          month: "Jun",
                          barHeight: Dimensions.height * .1,
                        ),
                        MonthBarModel(
                          month: "Jul",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Aug",
                          barHeight: Dimensions.height * .15,
                        ),
                        MonthBarModel(
                          month: "Sep",
                          barHeight: Dimensions.height * .15,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            BottomContainer()
          ],
        ),
      ),
    );
  }
}
